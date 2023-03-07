## What is mosey?

Allows you to work with large movement datasets. Implemented in R. Interfaces with Movebank and Google Earth Engine

## Why use mosey?

Movement data are rapidly growing in size. need better tools than csv files. Analyses combining datasets found on movebank are becoming more common. 

Can have a database of movement data with one 

download_studies.sh

## Tell me more!

mosey is made up of four integrated projects: mosey_get, mosey_db, mosey_env, and mosey_view

## mosey_get

implements movebank api

## mosey_db

uses mosey_get to download data from movebank

## mosey_env

annotate movement data with any environmental data on earth engine. even derive your own, on-the-fly layers and annotate against those

## mosey_view

movement data is complex, need a way to seamlessly browse on a map. uses shiny and leaflet. Can select individuals, time periods, color by attributes.
