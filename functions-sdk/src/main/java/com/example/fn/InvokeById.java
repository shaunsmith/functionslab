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

    static String USAGE = "Usage: java -jar <jar-name>.jar <invoke endpoint> <functionid> [<payload string>]";
    static String PROFILE_NAME = "workshop"; // null indicates the default profile

    public static void main(String[] args) throws Exception {

        if (args.length < 2) {
            System.err.println(USAGE);
            System.exit(-1);
        }

        String invokeEndpointURL = args[0];
        String functionId = args[1];
        String payload = args.length == 3 ? args[2] : "";

        AuthenticationDetailsProvider authProvider = new ConfigFileAuthenticationDetailsProvider(PROFILE_NAME);
        try (FunctionsInvokeClient fnInvokeClient = new FunctionsInvokeClient(authProvider)) {
            fnInvokeClient.setEndpoint(invokeEndpointURL);

            InvokeFunctionRequest ifr = InvokeFunctionRequest.builder().functionId(functionId)
                    .invokeFunctionBody(StreamUtils.createByteArrayInputStream(payload.getBytes())).build();

            System.err.println("Invoking function endpoint - " + invokeEndpointURL + " with payload " + payload);
            InvokeFunctionResponse resp = fnInvokeClient.invokeFunction(ifr);
            System.out.println(IOUtils.toString(resp.getInputStream(), StandardCharsets.UTF_8));
        }
    }
}
