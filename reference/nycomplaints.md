# Complaints to NYC Council Constituent Services

Complaints data from New York City's CouncilStat

## Usage

``` r
nycomplaints
```

## Format

A data frame with 341,299 rows and 11 variables:

- `unique_key`:

  character Complaint identifier.

- `account`:

  character NYC Council District that created the casework, this may or
  not be the district that the constituent lives in.

- `opendate`:

  date Date the casework is created by staff.

- `closedate`:

  date Close Date is the date the casework was closed. A casework could
  be closed because the issue is resolved or because no further action
  could be taken.

- `complaint_type`:

  character Broader category designated by staff for the constituent
  casework. complaint_type corresponds to NYC Council Legislative
  Committees.

- `descriptor`:

  character Specific category designated by staff for the constituent
  casework.

- `zip`:

  integer Zip code of the constituent.

- `borough`:

  character Borough of the constituent.

- `city`:

  character City of the constituent.

- `council_dist`:

  Council District of the constituent.

- `community_board`:

  Community Board of the constituent.

## Details

Table: Data summary

|                                                  |              |
|--------------------------------------------------|--------------|
|                                                  |              |
| Name                                             | nycomplaints |
| Number of rows                                   | 341299       |
| Number of columns                                | 11           |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |              |
| Column type frequency:                           |              |
| Date                                             | 2            |
| character                                        | 9            |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |              |
| Group variables                                  | None         |

**Variable type: Date**

|               |           |               |            |            |            |          |
|---------------|-----------|---------------|------------|------------|------------|----------|
| skim_variable | n_missing | complete_rate | min        | max        | median     | n_unique |
| opendate      | 0         | 1.00          | 2015-01-01 | 2025-01-09 | 2018-06-19 | 3296     |
| closedate     | 14142     | 0.96          | 2015-01-02 | 2025-01-09 | 2018-11-20 | 2686     |

**Variable type: character**

|                 |           |               |     |     |       |          |            |
|-----------------|-----------|---------------|-----|-----|-------|----------|------------|
| skim_variable   | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
| unique_key      | 0         | 1.00          | 12  | 12  | 0     | 341194   | 0          |
| account         | 0         | 1.00          | 6   | 6   | 0     | 51       | 0          |
| complaint_type  | 7431      | 0.98          | 3   | 25  | 0     | 59       | 0          |
| descriptor      | 20507     | 0.94          | 1   | 56  | 0     | 1259     | 0          |
| zip             | 50624     | 0.85          | 1   | 5   | 0     | 1370     | 0          |
| borough         | 63097     | 0.82          | 5   | 13  | 0     | 5        | 0          |
| city            | 35555     | 0.90          | 1   | 49  | 0     | 1465     | 0          |
| council_dist    | 60210     | 0.82          | 4   | 12  | 0     | 156      | 0          |
| community_board | 72772     | 0.79          | 1   | 16  | 0     | 99       | 0          |

Produced from NYC Open Data Initiative data. The dataset comes from
CouncilStat, which is used by many NYC Council district offices to enter
and track constituent cases that can range from issues around affordable
housing, to potholes and pedestrian safety. This dataset aggregates the
information that individual staff have input. However, district staffs
handle a wide range of complex issues. Each offices uses the program
differently, and thus records cases, differently and so comparisons
between accounts may be difficult. Not all offices use the program. For
more info - <http://labs.council.nyc/districts/data/>

## References

<https://data.cityofnewyork.us/City-Government/NYC-Council-Constituent-Services/9hzi-kbqb>,<http://labs.council.nyc/districts/data/>

## Author

Kieran Healy
