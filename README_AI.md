# Gas Station POS (Flutter, offline-first)

Mobile-first POS for gas stations. SQLite-backed (via Drift), works fully
offline; sync/printing hooks are stubbed and marked below.

## What's in this milestone

- **Database** (`lib/data/database.dart`) — Drift schema for the full model:
  Business → Branch → Pump, GasType + PriceHistory (current price is always
  the latest history row, never duplicated), Shift + MeterReading, Invoice →
  InvoiceItem + Payment. Every table carries `id (uuid)`, `updatedAt`,
  `isSynced`, `isDeleted` so a push/pull sync worker can be dropped in later
  without a migration.
- **CRUD UI**:
    - **Setup tab** — Branches, and Pumps per branch (add/edit/delete).
    - **Fuel tab** — Fuel types + price history (each price update is a new
      history row, not an overwrite — matches the ER diagram's intent).
    - **Shifts tab** — open/close shift with opening & closing cash count.
    - **Sell tab** — the actual POS screen: pick a pump, add fuel line items
      (auto-fills current price), discount, cash/card/wallet payment, saves
      invoice + items + payment atomically.
    - **Invoices tab** — history list, detail view, void.

## Not wired yet (stubbed on purpose, next milestones)

- **Wireless printing** — `Print receipt` button is a placeholder. Packages
  are already in `pubspec.yaml` (`esc_pos_printer` for WiFi/TCP thermal
  printers, `print_bluetooth_thermal` + `esc_pos_utils_plus` for Bluetooth).
  Next step: build the ESC/POS byte stream from an `Invoice` + its
  `InvoiceItem`s and send it over whichever transport the printer uses.
- **PDF invoice export** — same idea, `pdf` + `printing` packages are in
  `pubspec.yaml`, just needs a template.
- **Sync to a backend** — schema is ready (uuid PKs, `isSynced`/`updatedAt`),
  but no push/pull worker yet. `connectivity_plus` is already a dependency.
- **Real login** — currently seeds one "Cashier 1" user on first launch. Swap
  `currentUserIdProvider` for a PIN-login screen backed by the `Users` table.
- **Multi-branch switching** — `currentBranchIdProvider` defaults to the
  first branch; add a branch picker once a station runs more than one.

## Running it

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # generates database.g.dart
flutter run
```

`database.g.dart` is Drift's generated code and is **not** included here —
`build_runner` creates it from `lib/data/database.dart` on first build, and
regenerates it any time you change a table.

## Project layout

```
lib/
  data/
    database.dart      # Drift tables + typed queries
    providers.dart      # Riverpod: db instance, current business/branch/user
  screens/
    branches_screen.dart   # Branches + Pumps CRUD
    gas_types_screen.dart  # Fuel types + price history CRUD
    shifts_screen.dart     # Open/close shift
    pos_screen.dart        # New sale (the core POS flow)
    invoices_screen.dart   # Invoice history + detail + void
  utils/ids.dart        # uuid generator
  main.dart             # bootstrap (seeds default business/branch/cashier), nav shell
```
