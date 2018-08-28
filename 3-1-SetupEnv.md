#  Setup Local Development Environment

## Collect information needed in subsequent steps

user OCID - Please get your user OCID from OCI console > User Settings screen

private key file - 


## API signing key 

Ask your lab instructor for the actual keys to use during the labs. Overwrite empty key files in the [keys](keys) folder with the actual key files provided by your instructor.

Make a note of the full path of your private key file.


## OCI CLI configuration

Note: Functions does NOT require you to install the OCI CLI. All you need is to enter your user account details in the  `~/.oci/config` file.

Edit (or create) the `~/.oci/config` file. Copy the contents of [util/workshop-devrel-profile](util/workshop-devrel-profile) and append (paste) to the bottom of your `~/.oci/config` file.

## Install Fn CLI

Run the following command to install (or update) the `fn` CLI. This is documented in the `install` section of the [fn CLI readme](https://github.com/fnproject/cli/blob/master/README.md#install). 

``` 
curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
```

## 





