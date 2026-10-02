##1 Set the region to <REGION>

gcloud config set compute/region REGION

##2 To view the project region setting, run the following command:

gcloud config get-value compute/region

##3.Set the zone to <ZONE>:

gcloud config set compute/zone ZONE

##4 To view the project zone setting, run the following command:

gcloud config get-value compute/zone

## Copy your project ID to your clipboard or text editor. The project ID is listed in 2 places:

In the Cloud Console, on the Dashboard, under Project info. (Click Navigation menu (Navigation menu icon), and then click Cloud overview > Dashboard.

## In Cloud Shell, run the following gcloud command, to view the project id for your project:

gcloud config get-value project

## In Cloud Shell, run the following gcloud command to view details about the project:

gcloud compute project-info describe --project $(gcloud config get-value project)

###gcloud compute project-info describe --project $(gcloud config get-value project)




#### Setting environment variables


##Create an environment variable to store your Project ID:

export PROJECT_ID=$(gcloud config get-value project)

##Create an environment variable to store your Zone:

export ZONE=$(gcloud config get-value compute/zone)

## To verify that your variables were set properly, run the following commands:

echo -e "PROJECT ID: $PROJECT_ID\nZONE: $ZONE"


## To create your VM, run the following command:

gcloud compute instances create gcelab2 --machine-type e2-medium --zone $ZONE

## Command details

##gcloud compute allows you to manage your Compute Engine resources in a format that's simpler than the Compute Engine   API.
##instances create creates a new instance.gcelab2 is the name of the VM.
##The --machine-type flag specifies the machine type as e2-medium.
##The --zone flag specifies where the VM is created.
##If you omit the --zone flag, the gcloud tool can infer your desired zone based on your default properties. Other required instance settings (such as machine type and image) are set to default values if you do not specify them in the ##create command.


##
gcloud compute instances create --help


##Run the following command:



gcloud -h

gcloud config --help

gcloud help config


##The results of the gcloud config --help and gcloud help config commands are equivalent. Both return long, detailed help.

##There are global flags in gcloud that govern the behavior of commands on a per-invocation level. Flags override any values set in SDK properties.

##View the list of configurations in your environment:


gcloud config list


## To see all properties and their settings:

gcloud config list --all

## List your components:

gcloud components list


### Task 2. Filtering command-line output
##The gcloud command-line interface (CLI) is a powerful tool for working at the command line. You may want specific information to be displayed.

##List the compute instance available in the project:

gcloud compute instances list

## List the gcelab2 virtual machine:

gcloud compute instances list --filter="name=('gcelab2')"


## List the firewall rules in the project:

gcloud compute firewall-rules list

##List the firewall rules for the default network:

gcloud compute firewall-rules list --filter="network='default'"

##List the firewall rules for the default network where the allow rule matches an ICMP rule:

gcloud compute firewall-rules list --filter="NETWORK:'default' AND ALLOW:'icmp'"


##Task 3. Connecting to your VM instance
##gcloud compute makes connecting to your instances easy. The gcloud compute ssh command provides a wrapper around SSH, which takes care of authentication and the mapping of instance names to IP addresses.

##To connect to your VM with SSH, run the following command:

gcloud compute ssh gcelab2 --zone $ZONE

##Install nginx web server on to virtual machine:

sudo apt update && sudo apt install -y nginx


exit


## Task 4. Updating the firewall

#List the firewall rules for the project:

gcloud compute firewall-rules list


## Try to access the nginx service running on the gcelab2 virtual machine.

curl http://$(gcloud compute instances list --filter=name:gcelab2 --format='value(EXTERNAL_IP)')

## Add a tag to the virtual machine:

gcloud compute instances add-tags gcelab2 --tags http-server,https-server

## Update the firewall rule to allow:

gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

## List the firewall rules for the project:

gcloud compute firewall-rules list --filter=ALLOW:'80'

## Verify communication is possible for http to the virtual machine:

curl http://$(gcloud compute instances list --filter=name:gcelab2 --format='value(EXTERNAL_IP)')

## Task 5. Viewing the system logs

gcloud logging logs list


## View the logs that relate to compute resources:


gcloud logging logs list --filter="compute"

## Read the logs related to the resource type of gce_instance:


gcloud logging read "resource.type=gce_instance" --limit 5

##Read the logs for a specific virtual machine:


gcloud logging read "resource.type=gce_instance AND labels.instance_name=gcelab2" --limit 5

##Task 6. Testing your understanding
##The following multiple-choice question should reinforce your understanding of this lab's concepts.
## if question is Three basic ways to interact with Google Cloud services and resources are:

Client libraries
Command-line interface
Cloud Console




























