//Authenticate
// Create a ServiceBusClient that will authenticate using a connection string
using Azure;
using Azure.Messaging.ServiceBus;

internal class Program
{
    private static async Task Main(string[] args)
    {

        var queueName = "aaprepqueue";
        await using var client = new ServiceBusClient("Endpoint=sb://aaprepbus.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=w9YPLurGTF1O8lyMhcQql5unsoMonL3XX2sVkaJlQus=");
        // create the sender
        ServiceBusSender sender = client.CreateSender(queueName);

        // create a message that we can send. UTF-8 encoding is used when providing a string.
        ServiceBusMessage message = new ServiceBusMessage("Hello world!");

        // send the message
        await sender.SendMessageAsync(message);

        // create a receiver that we can use to receive the message
        ServiceBusReceiver receiver = client.CreateReceiver(queueName);

        // the received message is a different type as it contains some service set properties
        ServiceBusReceivedMessage receivedMessage = await receiver.ReceiveMessageAsync();

        // get the message body as a string
        string body = receivedMessage.Body.ToString();
        Console.WriteLine(body);
    }
}
