echo "Removing all Homework Projects for GUID=$GUID"
oc delete project -nexus
oc delete project arcadia-dev
oc delete project arcadia-test
oc delete project arcadia-prod