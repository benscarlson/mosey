# Mosey

![mosey system cartoon](/docs/assets/images/mosey_cartoon_no_title.png)

# What is mosey?

Mosey is an integrated set of tools that allows you to work with large animal movement datasets. Implemented in R and command-line ready, mosey downloads data directly from [Movebank](https://www.movebank.org) and stores it in a relational database. Browse the data on a map, extract environmental data using [Google Earth Engine](https://developers.google.com/earth-engine/datasets), or access the database in your analysis scripts.

# Why use mosey?

Animal movement data are growing so rapidly that traditional approaches to storing and accessing the data are no longer feasible. This is especially true now that ecologists are attempting broad-scale, macroecological analyses using massive movement datasets available on aggregators such as Movebank. 

The heart of mosey is a server-less relational database, which means it does not require any special setup to use. It and can store and rapidly access many GB of data. Having all of your data in one database enables you to write summary reports or extract metadata with much greater ease than if the data is stored in multiple csv files.

mosey is also easy to use. Just initialize an empty database

```{bash}
cat $MOSEYDB_SRC/db/create_db.sql | sqlite3 data/mosey.db
```

Set up your list of studies in `studies.csv`, and load them from Movebank

```{bash}
$MOSEYDB_SRC/db/load_studies.sh
```

You now have a movement database that can be accessed from any R script.

# Tell me more!

mosey is made up of four integrated projects: [mosey_get](https://github.com/benscarlson/mosey_get), [mosey_db](https://github.com/benscarlson/mosey_db), [mosey_env](https://github.com/benscarlson/mosey_env), and [mosey_view](https://github.com/benscarlson/mosey_view)

## mosey_get

[mosey_get](https://github.com/benscarlson/mosey_get) implements the [movebank api](https://github.com/movebank/movebank-api-doc/blob/master/movebank-api.md). You can access the raw Movebank entities using a simple R interface instead of forming your own REST calls. mosey_get is the package that allows mosey_db to download movement data.

![mosey get cartoon](/docs/assets/images/mosey_get_cartoon.png)

## mosey_db

[mosey_db](https://github.com/benscarlson/mosey_db) downloads raw data from Movebank using mosey_get. Raw data from movebank has considerable [issues](https://github.com/benscarlson/mosey_get/blob/master/guide_api_data.md) and should not be used directly. To address these problems, mosey_db performs extensive data cleaning, then loads the data into an sqlite database. You can then access data from this database using dedicated software such as [db browser](https://sqlitebrowser.org/), or from R using packages such as [dbplyr](https://dbplyr.tidyverse.org/).

![mosey db cartoon](/docs/assets/images/mosey_db_cartoon.png)

## mosey_env

[mosey_env](https://github.com/benscarlson/mosey_env) allows you to associate environmental data to movement tracks. In this sense, it is similar to other (and easier to use) systems such as [Env-DATA](https://www.movebank.org/cms/movebank-content/env-data) and [STOAT](https://mol.org/stoat/). mosey_env is different for several reasons

* Designed to be part of a scripted workflow, and not around GUI-based interaction. 
* Can access any environmental layers on Google Earth Engine, which means mosey_env has access to a larger and constantly updated set of layers than other systems. 
* Uses Earth Engine's asynchronous batch system, meaning much larger data sets can be annotated. 
* Most uniquely, you can create new, custom layers and dynamically extract environmental data, without having to export the raster assests first. For example, a global, monthly distance-to-water time-series based on the [JRC data set](https://global-surface-water.appspot.com/) is not currently available on any annotation system and would be far to large to export and store. Using mosey_env, you can dynamically create the layer and annotate in the same operation, which means there is no need to create the raster assets first.

![mosey env cartoon](/docs/assets/images/mosey_env_cartoon.png)

## mosey_view

[mosey_view](https://github.com/benscarlson/mosey_view) displays the movement data on a map. Movement data is complex, and it is difficult to explore using static plots. mosey_view allows you to seamlessly browse the data using leaflet and shiny. You can filter the data by individuals, time periods, or color by other attributes.

![screenshot](/docs/assets/images/mosey_view_screenshot.png)

