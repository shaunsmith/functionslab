/***
 * @author shaunsmith
 * @author abhirockzz
 */

package com.example.fn;

import java.nio.charset.StandardCharsets;

import org.apache.commons.io.IOUtils;

import com.oracle.bmc.auth.AuthenticationDetailsProvider;
import com.oracle.bmc.auth.ConfigFileAuthenticationDetailsProvider;
import com.oracle.bmc.functions.FunctionsInvokeClient;
import com.oracle.bmc.functions.requests.InvokeFunctionRequest;
import com.oracle.bmc.functions.responses.InvokeFunctionResponse;
import com.oracle.bmc.util.StreamUtils;

public class InvokeById {

    static String USAGE = "Usage: java -jar <jar-name>.jar <oci-profile> <invoke-endpoint> <function-id> [<payload-string>]";

    public static void main(String[] args) throws Exception {

        if (args.length < 3) {
            System.out.println(USAGE);
            System.exit(-1);
        }

        String ociProfile = args[0];
        String invokeEndpointURL = args[1];
        String functionId = args[2];
        String payload = args.length == 4 ? args[3] : "";

        AuthenticationDetailsProvider authProvider = new ConfigFileAuthenticationDetailsProvider(ociProfile);
        try (FunctionsInvokeClient fnInvokeClient = new FunctionsInvokeClient(authProvider)) {
            fnInvokeClient.setEndpoint(invokeEndpointURL);

            InvokeFunctionRequest ifr = InvokeFunctionRequest.builder().functionId(functionId)
                    .invokeFunctionBody(StreamUtils.createByteArrayInputStream(payload.getBytes())).build();

            System.out.println("Invoking function endpoint - " + invokeEndpointURL + " with payload [" + payload + "]");
            InvokeFunctionResponse resp = fnInvokeClient.invokeFunction(ifr);
            System.out.println(IOUtils.toString(resp.getInputStream(), StandardCharsets.UTF_8));
        }
    }
}
