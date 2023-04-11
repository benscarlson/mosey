# Mosey

![mosey system cartoon](/docs/assets/images/mosey_cartoon_no_title.png)

# What is mosey?

Mosey is an integrated set of tools that allows you to work with large animal movement datasets. Implemented in R and command-line ready, mosey downloads data directly from [Movebank](https://www.movebank.org) and stores it in a relational database. Browse the data on a map, extract environmental data using [Google Earth Engine](https://developers.google.com/earth-engine/datasets), or access the database in your analysis scripts.

# Why use mosey?

Animal movement data are growing so rapidly that traditional approaches to storing and accessing the data such as csv files are no longer feasible. This is especially true now that ecologists are attempting broad-scale, macroecological analyses using big movement datasets available on aggregators such as Movebank. 

The heart of mosey is an Sqlite database. Sqlite is a server-less relational database, which means it does not require any special setup to use. It and can store and rapidly access many GB of data. Having all of your data in one database enables you to write summary reports or extract metadata with much greater ease than if the data is stored in multiple csv files.

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

mosey is made up of four integrated projects: mosey_get, mosey_db, mosey_env, and mosey_view

## mosey_get

[mosey_get](https://github.com/benscarlson/mosey_get) implements the [movebank api](https://github.com/movebank/movebank-api-doc/blob/master/movebank-api.md). You can access the raw Movebank entities using a simple R interface instead of forming your own REST calls. mosey_get is the package that allows mosey_db to download movement data.

![mosey get cartoon](/docs/assets/images/mosey_get_cartoon.png)

## mosey_db

[mosey_db](https://github.com/benscarlson/mosey_db) uses mosey_get to download data from movebank. Raw data from movebank has considerable [issues](link), so mosey_db performs extensive cleaning, then loads it into an sqlite database.

![mosey db cartoon](/docs/assets/images/mosey_db_cartoon.png)

## mosey_env

[mosey_env](https://github.com/benscarlson/mosey_env) allows you to extract environmental data using any datasets available on Google Earth Engine. In addition, and unique to other environmental annotation systems, in Earth Engine you can create new, custom layers and dynamically extract environmental data, without having to export the rasters first. For example, a global, monthly distance-to-water time-series based on the JRC dataset is not currently available on any annotation system and would be far to large to export and store. Using mosey_env, you can dynamically create the layer and annotate in the same operation, which means there is no need to export the rasters first. 

![mosey env cartoon](/docs/assets/images/mosey_env_cartoon.png)

## mosey_view

[mosey_view](https://github.com/benscarlson/mosey_view) displays the movement data on a map. Movement data is complex, and it is difficult to explore using static plots. mosey_view allows you to seamlessly browse the data using leaflet and shiny. You can filter the data by individuals, time periods, or color by other attributes.

![screenshot](/docs/assets/images/mosey_view_screenshot.png)

