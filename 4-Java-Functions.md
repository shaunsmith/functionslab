# Java Functions and Unit Testing

This lab introduces the
[Fn Java FDK (Function Development Kit)](https://github.com/fnproject/fdk-java)
and takes you through the developer experience for building and unit testing
Java functions.

> As you make your way through this lab, look out for this icon. ![user
input](images/userinput.png) Whenever you see it, it's time for you to perform
an action.

## Creating a basic Java Function

Let's start by creating a new function.  In a terminal type the following:

![user input](images/userinput.png)
>`fn init --runtime java javafn`

The output will be:

```sh
Creating function at: /javafn
Function boilerplate generated.
func.yaml created.
```

![user input](images/userinput.png)
>```sh
>cd javafn
>```

The `fn init` command creates an simple function with a bit of boilerplate to
get you started. The `--runtime` option is used to indicate that the function
we're going to develop will be written in Java 11, the default version as of
this writing. A number of other runtimes are also supported.  

Use the `find` command to see the directory structure and files that the
`init` command has created.

![user input](images/userinput.png)
>`find .`

```sh
.
./func.yaml
./pom.xml
./src
./src/test
./src/test/java
./src/test/java/com
./src/test/java/com/example
./src/test/java/com/example/fn
./src/test/java/com/example/fn/HelloFunctionTest.java
./src/main
./src/main/java
./src/main/java/com
./src/main/java/com/example
./src/main/java/com/example/fn
./src/main/java/com/example/fn/HelloFunction.java
```

As usual, the init command has created a `func.yaml` file for your
function but in the case of Java it also creates a Maven `pom.xml` file
as well as a function class and function test class.

Take a look at the contents of the generated func.yaml file.

![user input](images/userinput.png)
>```sh
>cat func.yaml
>```

```yaml
schema_version: 20180708
name: javafn
version: 0.0.1
runtime: java
build_image: fnproject/fn-java-fdk-build:jdk11-1.0.86
run_image: fnproject/fn-java-fdk:jre11-1.0.86
cmd: com.example.fn.HelloFunction::handleRequest
```

The generated `func.yaml` file contains metadata about your function and
declares a number of properties including:

* schema_version--identifies the version of the schema for this function file
* version--the version of the function
* runtime--the language used for this function
* build_image--the image used to build your function's image
* run_image--the image your function runs in
* cmd--the `cmd` property is set to the fully qualified name of the Java
  class and method that should be invoked when your `javafn` function is
  called

The Java function init also generates a Maven `pom.xml` file to build and test
your function.  The pom includes the Fn Java FDK runtime and the test libraries
your function needs.

## Deploy your Java Function

With the `javafn` directory containing `pom.xml` and `func.yaml` you've got
everything you need to deploy the function to Oracle Functions.

Make sure your context is set to point to Oracle Functions. Use the `fn list
context` command to check. If everything is fine then let's deploy the function
to the app you created in the previous lab.  It should be named `labapp-NNN`
where `NNN` is your lap participant number. 

![user input](images/userinput.png)
>`fn --v deploy --app labapp-NNN `

```yaml
Deploying javafn to app: labapp-NNN
Building image phx.ocir.io/mytenancy/myuser/javafn:0.0.2
FN_REGISTRY:  phx.ocir.io/mytenancy/myuser
Current Context:  workshop
Sending build context to Docker daemon  14.34kB
Step 1/11 : FROM fnproject/fn-java-fdk-build:jdk11-1.0.86 as build-stage
 ---> 0ab30d8e3524
Step 2/11 : WORKDIR /function
 ---> Using cache
 ---> d6c3e60e0c04
Step 3/11 : ENV MAVEN_OPTS -Dhttp.proxyHost= -Dhttp.proxyPort= -Dhttps.proxyHost= -Dhttps.proxyPort= -Dhttp.nonProxyHosts= -Dmaven.repo.local=/usr/share/maven/ref/repository
 ---> Using cache
 ---> 9133a74699d5
Step 4/11 : ADD pom.xml /function/pom.xml
 ---> Using cache
 ---> f41ec165b9a8
Step 5/11 : RUN ["mvn", "package", "dependency:copy-dependencies", "-DincludeScope=runtime", "-DskipTests=true", "-Dmdep.prependGroupId=true", "-DoutputDirectory=target", "--fail-never"]
 ---> Using cache
 ---> 384bcd123a67
Step 6/11 : ADD src /function/src
 ---> Using cache
 ---> 2f3afddbba1b
Step 7/11 : RUN ["mvn", "package"]
 ---> Using cache
 ---> 00a1b46e3258
Step 8/11 : FROM fnproject/fn-java-fdk:jre11-1.0.86
 ---> d7caad608803
Step 9/11 : WORKDIR /function
 ---> Using cache
 ---> d075b963bbfd
Step 10/11 : COPY --from=build-stage /function/target/*.jar /function/app/
 ---> Using cache
 ---> c6a836a20c57
Step 11/11 : CMD ["com.example.fn.HelloFunction::handleRequest"]
 ---> Using cache
 ---> 10586c295622
Successfully built 10586c295622
Successfully tagged phx.ocir.io/mytenancy/myuser/javafn:0.0.2

Parts:  [phx.ocir.io mytenancy myuser javafn:0.0.2]
Pushing phx.ocir.io/mytenancy/myuser/javafn:0.0.2 to docker registry...The push refers to repository [phx.ocir.io/mytenancy/myuser/javafn]
...
Updating function javafn using image phx.ocir.io/mytenancy/myuser/javafn:0.0.2...
```

The output message
`Updating function javafn using image phx.ocir.io/mytenancy/myuser/javafn:0.0.2...`
let's us know that the function is packaged in the image
"phx.ocir.io/mytenancy/myuser/javafn:0.0.2".

## Invoke your Deployed Function

Use the the `fn invoke` command to call your function from the command line.

### Invoke with the CLI

The first is using the Fn CLI which makes invoking your function relatively
easy.  Type the following:

![user input](images/userinput.png)
>```sh
> fn invoke labapp-NNN javafn
>```

which results in:

```txt
Hello, World!
```

You can also pass data to the invoke command. For example:

![user input](images/userinput.png)
>```sh
> echo -n 'Bob' | fn invoke labapp-NNN javafn
>```

```txt
Hello, Bob!
```

"Bob" was passed to the function where it is processed and returned in the
output.

## Exploring the Code

We've generated, compiled, deployed, and invoked the Java function so let's take
a look at the code.  You may want to open the code in one of the IDEs available
in the lab environment.

Below is the generated `com.example.fn.HelloFunction` class.  As you can
see the function is just a method on a POJO that takes a string value
and returns another string value, but the Java FDK also supports binding
input parameters to streams, primitive types, byte arrays and Java POJOs
unmarshalled from JSON.  Functions can also be static or instance
methods.

```java
package com.example.fn;

public class HelloFunction {

    public String handleRequest(String input) {
        String name = (input == null || input.isEmpty()) ? "world"  : input;

        return "Hello, " + name + "!";
    }

}
```

This function returns the string "Hello, world!" unless an input string
is provided, in which case it returns "Hello, &lt;input string&gt;!".  We saw
this previously when we piped "Bob" into the function.   Notice that
the Java FDK reads from standard input and automatically puts the
content into the string passed to the function.  This greatly simplifies
the function code.

## Testing with JUnit

The `fn init` command also generated a JUnit test for the function which uses
the Java FDK's function test framework.  With this framework you can setup test
fixtures with various function input values and verify the results.

The generated test confirms that when no input is provided the function returns
"Hello, world!".

```java
package com.example.fn;

import com.fnproject.fn.testing.*;
import org.junit.*;

import static org.junit.Assert.*;

public class HelloFunctionTest {

    @Rule
    public final FnTestingRule testing = FnTestingRule.createDefault();

    @Test
    public void shouldReturnGreeting() {
        testing.givenEvent().enqueue();
        testing.thenRun(HelloFunction.class, "handleRequest");

        FnResult result = testing.getOnlyResult();
        assertEquals("Hello, world!", result.getBodyAsString());
    }

}
```

Let's add a test that confirms that when an input string like "Bob" is
provided we get the expected result.

![user input](images/userinput.png) Add the following method to the `HelloFunctionTest` class:


```java
    @Test
    public void shouldReturnWithInput() {
        testing.givenEvent().withBody("Bob").enqueue();
        testing.thenRun(HelloFunction.class, "handleRequest");

        FnResult result = testing.getOnlyResult();
        assertEquals("Hello, Bob!", result.getBodyAsString());
    }
```

You can see the `withBody()` method used to specify the value of the
function input.

You can run the tests by building your function with `fn build`.  This will
cause Maven to compile and run the updated test class.  You can also invoke your
tests directly from Maven using `mvn test` or from your IDE.

![user input](images/userinput.png)
>`fn build`

```sh
Building image fndemouser/javafn:0.0.2 .......
Function fndemouser/javafn:0.0.2 built successfully.
```

## Accepting JSON Input

Let's convert this function to use JSON for its input and output.

![user input](images/userinput.png) Replace the definition of `HelloFunction`
with the following:

```java
package com.example.fn;

public class HelloFunction {

    public static class Input {
        public String name;
    }

    public static class Result {
        public String salutation;
    }

    public Result handleRequest(Input input) {
        Result result = new Result();
        result.salutation = "Hello " + input.name;
        return result;
    }

}
```

We've created a couple of simple Pojos to bind the JSON input and output
to and changed the function signature to use these Pojos.  The
Java FDK will *automatically* bind input data based on the Java arguments
to the function. JSON support is built-in but input and output binding
is extensible and you could plug in marshallers for other
data formats like protobuf, avro or xml.

Let's build the updated function:

![user input](images/userinput.png)
>`fn build`

returns:

```sh
Building image fndemouser/javafn:0.0.2 .....
Error during build. Run with `--verbose` flag to see what went wrong. eg: `fn --verbose CMD`

Fn: error running docker build: exit status 1

See 'fn <command> --help' for more information. Client version: 0.5.16
```

Uh oh! To find out what happened rerun build with the verbose switch:

![user input](images/userinput.png)
>`fn --verbose build`

```sh
...
-------------------------------------------------------
 T E S T S
-------------------------------------------------------
Running com.example.fn.HelloFunctionTest
An exception was thrown during Input Coercion: Failed to coerce event to user function parameter type class com.example.fn.HelloFunction$Input
...
An exception was thrown during Input Coercion: Failed to coerce event to user function parameter type class com.example.fn.HelloFunction$Input
...
Tests run: 2, Failures: 0, Errors: 2, Skipped: 0, Time elapsed: 0.893 sec <<< FAILURE!
...
Results :

Tests in error:
  shouldReturnGreeting(com.example.fn.HelloFunctionTest): One and only one response expected, but 0 responses were generated.
  shouldReturnWithInput(com.example.fn.HelloFunctionTest): One and only one response expected, but 0 responses were generated.

Tests run: 2, Failures: 0, Errors: 2, Skipped: 0

[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 3.477 s
[INFO] Finished at: 2017-09-21T14:59:21Z
[INFO] Final Memory: 16M/128M
[INFO] ------------------------------------------------------------------------
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.12.4:test (default-test) on project hello: There are test failures.
```

*Oops!* as we can see this function build has failed due to test failures--we
changed the code significantly but didn't update our tests!  We really
should be doing test driven development and updating the test first, but
at least our bad behavior has been caught.  Let's update the tests
to reflect our new expected results.  

![user input](images/userinput.png) Replace the definition of
`HelloFunctionTest` with:

```java

package com.example.fn;

import com.fnproject.fn.testing.*;
import org.junit.*;

import static org.junit.Assert.*;

public class HelloFunctionTest {

    @Rule
    public final FnTestingRule testing = FnTestingRule.createDefault();

    @Test
    public void shouldReturnGreeting(){
        testing.givenEvent().withBody("{\"name\":\"Bob\"}").enqueue();
        testing.thenRun(HelloFunction.class,"handleRequest");

        FnResult result = testing.getOnlyResult();
        assertEquals("{\"salutation\":\"Hello Bob\"}", result.getBodyAsString());
    }
}

```

In the new `shouldReturnGreeting()` test method we're passing in the
JSON document

```js
{
    "name": "Bob"
}
```
and expecting a result of
```js
{
    "salutation": "Hello Bob"
}
```

If you re-run the tests in your IDE or via `fn -verbose build` we can see that
it now passes:

![user input](images/userinput.png)
>`fn --verbose build`

## Wrap Up

Congratulations! You've just completed an introduction to the Fn Java FDK.
There's so much more in the FDK than we can cover in a brief introduction.  Next
we'll take a look at troubleshooting.  We saw a little of this when our tests
failed but there are a few more techniques available.

NEXT: [*Troubleshooting*](5-Troubleshooting.md), UP: [*Labs*](1-Labs.md), HOME:
[*INDEX*](README.md)
