# Create the build configs
oc new-build --binary=true --name="orders-poller" -i=openshift/java:8 -n arcadia-dev
# TODO: test and prod


# Create the deployment config (including turning off triggers)
echo "Creating Deployment Configs.."
oc new-app arcadia-dev/orders-poller:0.0-0 --name=orders-poller --allow-missing-imagestream-tags=true -n arcadia-dev
oc set triggers dc/orders-poller --remove-all -n arcadia-dev

# Grant Jenkins service account edit permissions for the project
echo "Allow jenkins to edit in arcadia-dev"
oc policy add-role-to-user edit system:serviceaccount:shared-jenkins:jenkins -n arcadia-dev



# TODO:
# set_permissions() {
#   # the image in PPTE will be pulled from Test; as the environments are in different namespcaces,
#   # permissions need to be set.
#   oc policy add-role-to-group system:image-puller system:serviceaccounts:${project_name}-ppte -n ${project_name}-test
# }



# Create the pipeline
oc process -f ../templates/arcadia-pipeline.yaml -p APP_NAME=orders-poller -p PROJECT=arcadia-dev -p GIT_URL=https://github.com/briangallagher/orders-poller.git | oc create -f - -n shared-jenkins


