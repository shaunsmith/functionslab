#  Setup Local Development Environment

## OCI Login - Change Password

1. Your lab instructor will give you your `Cloud Tenant`, `User Name` and `Password`

2. Login to OCI Ashburn (home region) Console and change your password during the first login.

https://console.us-ashburn-1.oraclecloud.com/

3. Once you are done, please logout of the console. For the rest of the lab we will use the OCI Phoenix region/Console.


## Information needed in subsequent steps

1. OCI Phoenix Console: https://console.us-phoenix-1.oraclecloud.com

2. Region: us-phoenix-1

3. User OCID: Please get your user OCID from OCI console > User Settings screen

4. Key files: See next step for keys 


## API Signing Key 

1. This is your OCI private key, public key and fingerprint. 

2. Login to OCI Phoenix Console > Object Store > Select `workshop` compartment > Buckets > Go to the `workshop-prereqs` bucket and download your public and private keys.

3. Make a note of the full path of your private key file e.g. `/home/demo/Downloads/labs_pri_key.pem`


## OCI CLI Configuration

Note: Functions does NOT require you to install the OCI CLI. All you need to do is to enter your OCI user account details in the `~/.oci/config` file as per the steps below.

1. Login to OCI Phoenix Console > Object Store > Select `workshop` compartment > Buckets > Go to the `workshop-prereqs` bucket and download the `config` file. This file has a profile called `[workshop-devrel-profile]` which you will use for today's workshop.

2. Edit the downloaded `config` file. **Don't forget to** add your user-OCID (from OCI Phoenix Console > User Settings) and the-full-path-to-your-private-key-file in the downloaded `config` file.

3. If your machine already has `~/.oci/config` file, edit it. Copy the contents of the downloaded `config` file and append (paste) to the bottom of your `~/.oci/config` file.

4. If your machine doesn't have `~/.oci/config` file, create the `~/.oci` folder and move the downloaded `config` file in to the `~/.oci` folder.

``` 
mkdir ~/.oci

mv /home/demo/Downloads/config ~/.oci/config
``` 


## Fn CLI

1. In case you don't have the Fn CLI installed, run the following command to 
install (or update) the `fn` CLI. This is documented in the `install` section of 
the [fn CLI readme](https://github.com/fnproject/cli/blob/master/README.md#install). 

``` 
curl -LSs https://raw.githubusercontent.com/fnproject/cli/master/install | sh
```

This above command will install the `fn` CLI on your machine. 

2. Run the following command to verify the installation.

```
fn version

Client version: 0.5.29
Server version:  ?
```

3. Note if the fn server is running you will see `Server version: 0.3.622` or higher. 
You should stop the fn server since in this section we will connect to Oracle Functions service
and not your local server. To stop the local fn server use the following command:

```
fn stop
```

## Fn Context for OCI 

1. Login to OCI Phoenix Console > Object Store > Select `workshop` compartment > Buckets > Go to the `workshop-prereqs` bucket and download the `fn context` file named `workshop.yaml`. The fn CLI uses this file to connect to the Oracle Functions server and docker registry.

2. Edit the downloaded `workshop.yaml` file. **Don't forget to** replace `<NNN>` with your user number. Your lab instructor will give you your user number.

3. Move this `workshop.yaml` file to the `~/.fn/contexts/` folder. 

```
mv /home/demo/Downloads/workshop.yaml ~/.fn/contexts/
```

4. List all `fn contexts` on your machine. Run the following command:

```
fn ls context

CURRENT	NAME				PROVIDER	API URL			REGISTRY
	default				default		http://localhost:8080/v1
	workshop			oracle		https://functions.us-phoenix-1.oraclecloud.com	phx.ocir.io/<tenant-name>/<user-name>
```

5. Use `workshop` context. Run the following command:

```
fn use context workshop

Now using context: workshop
```

6. Check if `workshop` is now the current context. Run the following command. An `*` is used to indicate the current context as shown below.

```
fn ls context

CURRENT	NAME				PROVIDER	API URL			REGISTRY
	default				default		http://localhost:8080/v1
*	workshop			oracle		https://functions.us-phoenix-1.oraclecloud.com	phx.ocir.io/<tenant-name>/<user-name>
```

## Start Docker

Note: If you are using our labs virtual machine (given by your labs instructor) docker is already running. You can skip this step.

1. If you haven't already, start Docker. Follow the steps for your OS.

## Auth Token for OCIR

1. Go to OCI Phoenix Console > User settings > Auth tokens and generate a new Auth token. You will need this later to login to OCIR from a terminal window. 

2. Please make a note of your Auth Token (created above). You won't see it again on the OCI Console.

Note: If you forget the Auth Token you can delete this one and repeat the above steps to create a new token.

## OCIR Login from your machine 

1. Login to OCIR from a terminal window on the machine where you will run "fn deploy" later in the labs. Run the following command:

*Don't forget to replace `<NNN>` with your user number. Your lab instructor will give you your user number.*

```
docker login phx.ocir.io
Username: <tenant-name>/<user-name>
Password: <Auth-Token-created-above>
Login Succeeded
```

## Update Old Images (if you have an OLD Fn setup on your machine)

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

NAME		ID								
ws100app	ocid1.fnapp.oc1.phx.aaaaaaaaahyhix4ezjfro4unq5dqnapigdpdbl4ezjfro4yexts1il564y	
```
