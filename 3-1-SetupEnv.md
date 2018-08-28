#  Setup Local Development Environment

Clone this repo.

## Collect information needed in subsequent steps

user OCID - Please get your user OCID from OCI console > User Settings screen

private key file - 


## API Signing Key 

This is your OCI private key, public key and fingerprint. Ask your lab instructor for the actual keys to use during the labs. Overwrite empty key files in the [keys](keys) folder with the actual key files provided by your instructor.

Make a note of the full path of your private key file.


## OCI CLI Configuration

Note: Functions does NOT require you to install the OCI CLI. All you need to do is to enter your OCI user account details in the `~/.oci/config` file.

Edit (or create) your `~/.oci/config` file. Copy the contents of [util/workshop-devrel-profile](util/workshop-devrel-profile) shown below and append (paste) to the bottom of your `~/.oci/config` file.

Don't forget to add your user OCID and the full path to your private key file.

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

Run the following command to install (or update) the `fn` CLI. This is documented in the `install` section of the [fn CLI readme](https://github.com/fnproject/cli/blob/master/README.md#install). 

``` 
curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
```

This will install the fn CLI on your machine. Run the following command to verify the installation.

```
$ fn version

Client version: 0.4.150
Server version:  ?
```

## Fn Context for OCI 

Copy the fn context file [util/workshop.yaml](util/workshop.yaml) and place it in the `~/.fn/contexts/` folder. 



