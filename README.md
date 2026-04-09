# inventory-system-case-study
Submission for the Inventory Management System design challenge

# Inventory Case Study Submission

### Reasoning for Design Decisions
- **Inventory Logs:** I included a separate logging table. It’s better than just updating a "total" because it provides a history of *why* stock moved (sales vs. returns).
- **Relational Integrity:** I used Foreign Keys (FK) for warehouses and companies. This ensures we don't have "ghost" warehouses that aren't tied to a real company.
- **Self-Referencing Bundles:** I used a join table for bundles. This allows a product to be both a standalone item and a part of a kit.

### Assumptions Made
1. **Virtual Bundles:** I assumed bundles are not pre-packed. Their stock is calculated by looking at the individual items inside.
2. **Sales Activity:** I defined "recent activity" as a sale occurring within the last 30 days.
3. **Thresholds:** I assumed different warehouses might need different low-stock alerts for the same item.
