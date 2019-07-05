#!/bin/bash

oc new-project arcadia-dev --display-name="Arcadia Development"
oc new-project arcadia-test --display-name="Arcadia Test"
oc new-project arcadia-prod --display-name="Arcadia Prod"

######################################################################
############################  CI / CD ################################
######################################################################

# NOTE: reusing existing jenkins so set up is minimal

./setup_cicd.sh



######################################################################

######################################################################
######################## Nexus TODO: Storage issue ###################
# oc new-project arcadia-nexus --display-name="Arcadia Nexus"
# ./setup_nexus

######################################################################




######################################################################
############################## Node.js ##############################
######################################################################

# Node.js app install => supplier API
# oc new-app nodejs:8~https://github.com/briangallagher/supplier-api.git --name=supplier-api

######################################################################
############################## Postgres ##############################
######################################################################
# install through GUI
# admin/admin

# Find postgres
# oc get pods | grep post
# oc rsh <pod>
# PGPASSWORD=$POSTGRESQL_PASSWORD psql -h postgresql $POSTGRESQL_DATABASE $POSTGRESQL_USER

# Postgres
# CREATE TABLE stock(item_id serial PRIMARY KEY, item_name VARCHAR (50) UNIQUE NOT NULL, quantity integer NOT NULL);
# INSERT INTO stock(item_name,quantity) VALUES ('jacket', 10), ('pants', 5), ('shoes', 5);
# SELECT * FROM stock;
# https://blog.openshift.com/openshift-connecting-database-using-port-forwarding/

# psql -h postgresql sampledb admin
# \dt

######################################################################
############################## AMQ ###################################
######################################################################

# https://access.redhat.com/documentation/en-us/red_hat_amq/7.2/html-single/deploying_amq_broker_on_openshift_container_platform/index
# Red Hat AMQ Broker 7.2 (Ephemeral, no SSL)
# Also had to update the Image Stream Tag in the deployment to arcadia-dev/amq-broker-72-openshift:1.2 => through GUI