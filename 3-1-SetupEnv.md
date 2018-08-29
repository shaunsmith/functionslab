#  Setup Local Development Environment

Clone or download this repo.

## Information needed in subsequent steps

1. OCI Console: https://console.us-ashburn-1.oraclecloud.com

2. Tenant: oracle-serverless-devrel

3. Region: us-ashburn-1

4. Username and password: Your lab instructor will give you your user name and password

5. User OCID: Please get your user OCID from OCI console > User Settings screen

6. Key files: See next step for keys 



## API Signing Key 

1. This is your OCI private key, public key and fingerprint. Ask your lab instructor for the actual keys to use during the labs. Overwrite empty key files in the [keys](keys) folder with the actual key files provided by your instructor.

2. Make a note of the full path of your private key file.


## OCI CLI Configuration

Note: Functions does NOT require you to install the OCI CLI. All you need to do is to enter your OCI user account details in the `~/.oci/config` file.

1. Edit (or create) your `~/.oci/config` file. Copy the contents of the file [workshop-devrel-profile](util/workshop-devrel-profile) shown below and append (paste) to the bottom of your `~/.oci/config` file.

*Don't forget to add your user OCID and the full path to your private key file.*

```
[workshop-devrel-profile]
tenancy=ocid1.tenancy.oc1..aaaaaaaaydrjm77otncda2xn7qtv7l3hqnd3zxn2u6siwdhniibwfv4wwhta
region=us-ashburn-1
user=<your-user-ocid>
fingerprint=2c:bd:7b:5c:76:58:ec:77:6d:9b:f8:3b:be:a6:23:2b
key_file=<full-path-to-your-private-key> e.g. /Users/amy/labs_pri_key.pem
pass_phrase=emea
```

## oci-curl Configuration

1. Edit the file [/util/oci-curl.sh](/util/oci-curl.sh) cloned/downloaded on your machine. The relevant section of the file containing user account details is shown below. 

*Don't forget to add your user OCID and the full path to your private key file.*

```
	# workshop-NNN -in- oracle-serverless-devrel
        local tenancyId="ocid1.tenancy.oc1..aaaaaaaaydrjm77otncda2xn7qtv7l3hqnd3zxn2u6siwdhniibwfv4wwhta";
	local authUserId="<your-user-ocid>";
	local keyFingerprint="2c:bd:7b:5c:76:58:ec:77:6d:9b:f8:3b:be:a6:23:2b";
	local privateKeyPath="<full-path-to-your-private-key> e.g. /Users/john/labs_pri_key.pem";
```


## Fn CLI

1. Run the following command to install (or update) the `fn` CLI. This is documented in the `install` section of the [fn CLI readme](https://github.com/fnproject/cli/blob/master/README.md#install). 

``` 
curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
```

This above command will install the `fn` CLI on your machine. 

2. Run the following command to verify the installation.

```
fn version

Client version: 0.4.150
Server version:  ?
```

## Fn Context for OCI 

1. Copy the `fn context` file [workshop.yaml](util/workshop.yaml) to the `~/.fn/contexts/` folder. Contents of the file are shown below. 

*Don't forget to replace `<NNN>` with your user number. Your lab instructor will give you your user number.*

```
api-url: https://api.test.us-ashburn-1.functions.oci.oraclecloud.com
call-url: https://call.test.us-ashburn-1.functions.oci.oraclecloud.com
oracle.compartment-id: ocid1.compartment.oc1..aaaaaaaaokbzj2jn3hf5kwdwqoxl2dq7u54p3tsmxrjd7s3uu7x23tkegiua
oracle.profile: workshop-devrel-profile
provider: oracle
registry: iad.ocir.io/oracle-serverless-devrel/workshop-<NNN>
```

2. List all `fn contexts` on your machine. Run the following command:

```
fn ls context

CURRENT	NAME				PROVIDER	API URL			REGISTRY
	default				default		http://localhost:8080/v1
	workshop			oracle		https://api.test.us-ashburn-1.functions.oci.oraclecloud.com	iad.ocir.io/oracle-serverless-devrel/workshop-<NNN>
```

3. Use `workshop` context. Run the following command:

```
fn use context workshop

Now using context: workshop
```

4. Check if `workshop` is now the current context. Run the following command. An `*` is used to indicate the current context as shown below.

```
fn ls context

CURRENT	NAME				PROVIDER	API URL			REGISTRY
	default				default		http://localhost:8080/v1
*	workshop			oracle		https://api.test.us-ashburn-1.functions.oci.oraclecloud.com	iad.ocir.io/oracle-serverless-devrel/workshop-<NNN>
```

## Start Docker

1. If you haven't already, start Docker. Follow the steps for your OS.

## Auth Token for OCIR

1. Go to OCI Console > User settings > Auth tokens and generate a new Auth token. You will need this later to login to OCIR from a terminal window. 

2. Please make a note of your Auth Token (created above). You won't see it again on the OCI Console.

Note: If you forget the Auth Token you can delete this one and repeat the above steps to create a new token.

## OCIR Login from your machine 

1. Login to OCIR from a terminal window on the machine where you will run "fn deploy" later in the labs. Run the following command:

*Don't forget to replace `<NNN>` with your user number. Your lab instructor will give you your user number.*

```
docker login iad.ocir.io
Username: oracle-serverless-devrel/workshop-<NNN>
Password: <enter-your-Auth-Token-created-above>
Login Succeeded
```

## Update Old Images (ONLY if you have an OLD Fn setup on your machine)

If you have never played with open source Fn before you can skip this step.

```
docker pull node:8-alpine
docker pull fnproject/go:latest
docker pull fnproject/go:dev
```

```
docker pull fnproject/fnserver:latest
docker pull fnproject/ui:latest
```

## Verify the Setup

1. List apps in the workshop compartment. You may see zero or more apps. Run the following command:

```
fn list apps
 
NAME
workshop-100-app
workshop-101-app
```
