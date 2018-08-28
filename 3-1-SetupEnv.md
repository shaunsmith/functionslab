#  Setup Local Development Environment

Clone this repo.

## Collect information needed in subsequent steps

1. user OCID - Please get your user OCID from OCI console > User Settings screen

2. private key file - See next step for keys 


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

## Fn CLI

1. Run the following command to install (or update) the `fn` CLI. This is documented in the `install` section of the [fn CLI readme](https://github.com/fnproject/cli/blob/master/README.md#install). 

``` 
curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
```

This above command will install the `fn` CLI on your machine. 

2. Run the following command to verify the installation.

```
$ fn version

Client version: 0.4.150
Server version:  ?
```

## Fn Context for OCI 

1. Keep the `fn context` file [workshop.yaml](util/workshop.yaml) in the `~/.fn/contexts/` folder. Contents of the file are shown below. 

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
$ fn ls context

CURRENT	NAME				PROVIDER	API URL			REGISTRY
	default				default		http://localhost:8080/v1
	workshop			oracle		https://api.test.us-ashburn-1.functions.oci.oraclecloud.com	iad.ocir.io/oracle-serverless-devrel/workshop-<NNN>
```

3. Use `workshop` context. Run the following command:

```
$ fn use context workshop

Now using context: workshop
```

4. Check if `workshop` is now the current context. Run the following command. An `*` is used to indicate the current context as shown below.

```
$ fn ls context

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


