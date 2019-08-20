## Invoking oci-curl Configuration

In OCI you need to sign your requests to function http endpoints. Refer to [OCI
Signed
Requests](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/signingrequests.htm?TocPath=Developer%20Tools%20|REST%20APIs%20|_____4)
for more information and for sample clients in various popular languages.

One such client that OCI supports is Bash.  `oci-curl` is a Bash function that
which wraps `curl` and performs the required OCI request signing. It's useful
and easy to configure so we'll quickly get it setup to see how it can be used to
invoke a function.

1. Download the [oci-curl Bash
   script](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/signingrequests.htm#Bash)
   to `oci-curl.sh` and open it in an editor (e.g., gedit).

2. Edit the file to include your account details which you can find in your
   `~/.oci/config` file.  Copy paste from the config file to the oci-curl.sh
   script.

    ```shell
    function oci-curl {

        # TODO: update these values to your own
        local tenancyId="";
        local authUserId="";
        local keyFingerprint="";
        local privateKeyPath="";
    ```

With the script updated with your credentials you can source it to define the
oci-curl function in your Bash shell.

![user input](images/userinput.png)
>```
> source oci-curl.sh
>```

## Function Invocation Endpoint

To invoke a function you'll need its "invoke endpoint" which can be obtained by
inspecting the function using the `fn inspect` command.  To inspect the "javafn"
function you defined earlier, type the following:

![user input](images/userinput.png)
>```
> fn inspect f labapp-NNN javafn
>```

which will return a JSON object similar to the following:

```json
{
	"annotations": {
		"fnproject.io/fn/invokeEndpoint": "https://k2kl7irx34a.us-phoenix-1.functions.oci.oraclecloud.com/20181201/functions/ocid1.fnfunc.oc1.us-phoenix-1.aaaaaaaaabzleh7l3ry7l2zpro6ddmgv3kwnwkn7xrtuxodtddsjbvwp3swa/actions/invoke",
		"oracle.com/oci/compartmentId": "ocid1.compartment.oc1..aaaaaaaaon25g3kisxyv4k54vvtrxadpbj2bbpetrpcacwax72uhmzpflyua"
	},
	"app_id": "ocid1.fnapp.oc1.us-phoenix-1.aaaaaaaaag4h7xotdzz27sp7z23ci6z4jqj4raq43ui6ouae5k2kl7irx34a",
	"created_at": "2019-04-02T21:56:55.812Z",
	"id": "ocid1.fnfunc.oc1.us-phoenix-1.aaaaaaaaabzleh7l3ry7l2zpro6ddmgv3kwnwkn7xrtuxodtddsjbvwp3swa",
	"idle_timeout": 30,
	"image": "phx.ocir.io/cloudnative-devrel/shsmith/javafn:0.0.2",
	"memory": 128,
	"name": "javafn",
	"timeout": 30,
	"updated_at": "2019-04-02T22:01:02.171Z"
}
```

If you look closely you can see there's an `fnproject.io/fn/invokeEndpoint` 
property buried in the JSON.  You could copy/paste from here but there's a
somewhat more convenient way to just get the invoke endpoint.  You just add
`--endpoint` to your ispect command:

![user input](images/userinput.png)
>```
> fn inspect f --endpoint labapp-NNN javafn
>```

which just returns the value of the `fnproject.io/fn/invokeEndpoint` property:

```shell
https://k2kl7irx34a.us-phoenix-1.functions.oci.oraclecloud.com/20181201/functions/ocid1.fnfunc.oc1.us-phoenix-1.aaaaaaaaabzleh7l3ry7l2zpro6ddmgv3kwnwkn7xrtuxodtddsjbvwp3swa/actions/invoke
```

## Calling the Function with oci-curl

The syntax of `oci-curl` is *not* exactly like `curl`.  To do a **POST**, which
is the required invocation method for a function, it is:

`oci-curl <hostname> post <payload file> <path>`

This means you're going to have to extract the hostname and path elements from
the url you obtained.  In our example we have:

hostname=`k2kl7irx34a.us-phoenix-1.functions.oci.oraclecloud.com`
path=`/20181201/functions/ocid1.fnfunc.oc1.us-phoenix-1.aaaaaaaaabzleh7l3ry7l2zpro6ddmgv3kwnwkn7xrtuxodtddsjbvwp3swa/actions/invoke`

**NOTE:** the "path" must begin with a `/`.

As mentioned above, you need to invoke a function with POST as you are passing a
payload to your function for processing.  `oci-curl` takes a payload via a file
so let's create a file to pass.  In a terminal you can create a `payload.txt`
file by `cat`ing the text "Functions" into the it (closing with ctrl-d) or you
can create and edit it using a text editor:

![user input](images/userinput.png)
>```
> cat > payload.txt
> Functions
>^d
>```

Now let's invoke the function.  You'll need to use the host and path elements
of your function endpoint, but using those from our example we'd have:

![user input](images/userinput.png)
>```
> oci-curl k2kl7irx34a.us-phoenix-1.functions.oci.oraclecloud.com post payload.txt /20181201/functions/ocid1.fnfunc.oc1.us-phoenix-1.aaaaaaaaabzleh7l3ry7l2zpro6ddmgv3kwnwkn7xrtuxodtddsjbvwp3swa/actions/invoke
>```

You'll be prompted for the passphrase for your private key, which is **workshop**.

![](images/userinput.png)
>``` 
> Enter pass phrase for /home/demo/.oci/workshop_pri_key.pem
.pem: workshop
> 
>```

If all goes well you should see the output concatinating "Hello, " with the
contents of the payload.txt file.

```sh
Hello, Functions
```

You've successfully invoked a function using a signed HTTP request using curl!
Next we'll look how we can call functions from client code using the OCI SDK.

NEXT: [*Functions Clients-OCI SDK*](8-Functions-Clients-SDK.md), UP:
[*Labs*](1-Labs.md), HOME: [*INDEX*](README.md)
