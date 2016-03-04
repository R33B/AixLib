within AixLib.Utilities.Communication.SocketCommunication.Functions.TCP.Internal;
function SocketConnect
  "External C function to connect to server with <IP> on <port>"
input String ip "IP address of server";
input String port "Port at server to connect to";
output Integer socketHandle "SocketHandle";
output Integer ans
    "External C-Function returns error handling and prints in case of failure a message. 0 = OK!, 1 == failed";

external "C" ans = SocketConnect(ip,port,socketHandle) annotation (
    Include="#include \"AixLibSocketCommunication.h\"",
    IncludeDirectory="modelica://AixLib/Resources/Include");

annotation (Documentation(revisions="<HTML>
<ul>
  <li><i>September 24, 2013&nbsp;</i>
         by Georg Ferdinand Schneider:<br>
         First implementation
</li>

 <li><i>October 07, 2015&nbsp;</i>
         by Georg Ferdinand Schneider:<br>
         Revised for publishing</li>

</ul>
</HTML>",info="<html>

<p>
Function to establish a connection between socket created by SocketInit() and TCP-server.
IP-Address of the server and port to connect to on server have to be given. Note that SocketConnect() 
is already included in TCP_Constructor() and is here just for debugging.
</p>
<h4>Usage of Function</h4>

Example connect to server with IP (0.11.11.11) on port 1234

<pre>

model dummyUsage

  Integer state \"Return variable of functions 0 == OK!, 1 == error\";
   
initial algorithm 

  state := SocketInit();
  state := SocketConnect(\"0.11.11.11\",\"1234\");
  
equation

algorithm
 
end dummyUsage;
</pre>
<p>
If server is running function connects to server 0.11.11.11 on port 1234.

<h4>Errors</h4>
state == 0, everything fine, state == 1, error where an error message will be reported in the 
Dymola messages window. Error codes and descriptions can be found in UsersGuide.

<h4>C Source Code of SocketConnect()</h4>

<pre>
int SocketConnect(tIpAddr ip, tPort port)
{
        int iResult;
    // Resolve the server address and port
    iResult = getaddrinfo(ip, port, &gHints, &gpResult);
    if ( iResult != 0 ) {
                ModelicaFormatMessage(\"SocketConnect(): getaddrinfo failed with error: %d\n\", iResult);
        WSACleanup();
        return 1;
    }

    // Attempt to connect to an address until one succeeds
    for(gPtr=gpResult; gPtr != NULL ;gPtr=gPtr->ai_next) {

        // Create a SOCKET for connecting to server
        gConnectSocket = socket(gPtr->ai_family, gPtr->ai_socktype, 
            gPtr->ai_protocol);
        if (gConnectSocket == INVALID_SOCKET) {
                        ModelicaFormatMessage(\"SocketConnect(): Socket failed with error: %ld\n\", WSAGetLastError());
                        WSACleanup();
            return 1;
        }

        // Connect to server.
        iResult = connect( gConnectSocket, gPtr->ai_addr, (int)gPtr->ai_addrlen);
        if (iResult == SOCKET_ERROR) {
            closesocket(gConnectSocket);
            gConnectSocket = INVALID_SOCKET;
            continue;
        }
        break;
    }

    freeaddrinfo(gpResult);

    if (gConnectSocket == INVALID_SOCKET) {
                ModelicaFormatMessage(\"SocketConnect(): Unable to connect to server!\n\");     
                WSACleanup();
        return 1;
    }
        return 0;
}
</pre>
</html>"));
end SocketConnect;