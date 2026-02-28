
Window Functions vs GROUP BY
Window Functions:

* Preserve row-level detail.
* Number of rows stays the same.
* Each row can access aggregated values without losing original data.
  GROUP BY:
* Reduces granularity by grouping rows.
* Returns one row per group.
* Original row-level details are lost.

Clustered vs Non-Clustered Indexes
Clustered Index:

* Sorts and stores actual table rows.
* Reads faster, writes slower.
* Storage efficient.
* Leaf nodes contain full table data.
  Non-Clustered Index:
* Contains pointers to table rows.
* Reads slower, writes faster.
* Requires extra storage.
* Leaf nodes do not store actual rows.
  Why only one clustered index per table?
* Defines physical order of table data; table can be sorted in only one way at a time.

Filtered & Unique Indexes
Filtered Index:

* Non-clustered index on a subset of rows (WHERE condition).
* Saves storage and improves query performance.
  Unique Index on Email column:
* INSERT: slower due to duplicate checks.
* SELECT: faster due to direct lookups.

Choosing the Right Index for Staging Table

* Temporary table, millions of inserts, read once, then delete.
* Use Heap structure: fast inserts, no need for indexes, easy deletion.

Database Transactions (ACID)
Atomicity:

* All operations succeed or none are applied.
  Without transactions:
* Partial failures can leave database corrupted or inconsistent.
