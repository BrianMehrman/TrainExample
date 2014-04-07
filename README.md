== README

This is a simple application to display a list of trains. The trains can be provided via manual input through the interface or by a csv file using the following headers (train_line, route_name, run_number, operator_id)

## Features

* Lists trains in order by run_number
* import trains via CSV file
* No duplicate trains

---
## Environment
* Ruby -v 2.0.0
* Rails -v 4.0.3

---
## Setup
To use this application all you need to do is

```
bundle
rake db:migrate
rails s
```

You can run the tests using the following command


```
rspec --format nested
```

