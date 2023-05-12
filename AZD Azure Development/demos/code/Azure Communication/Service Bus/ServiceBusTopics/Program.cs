
using Azure.Messaging.ServiceBus;

internal class Program
{
    private static async Task Main(string[] args)
    {
        string connectionString = "Endpoint=sb://aaprepbus.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=w9YPLurGTF1O8lyMhcQql5unsoMonL3XX2sVkaJlQus=";
        string queueName = "aaprepqueue";
        string topicName = "aapreptopic";
        string subscriptionName = "prepsub";

        // since ServiceBusClient implements IAsyncDisposable we create it with "await using"
        await using var client = new ServiceBusClient(connectionString);

        // create the sender that we will use to send to our topic
        ServiceBusSender sender = client.CreateSender(topicName);

        // create a message that we can send. UTF-8 encoding is used when providing a string.
        ServiceBusMessage message = new ServiceBusMessage("Hello world!");

        // send the message
        await sender.SendMessageAsync(message);

        // create a receiver for our subscription that we can use to receive the message
        ServiceBusReceiver receiver = client.CreateReceiver(topicName, subscriptionName);

        // the received message is a different type as it contains some service set properties
        ServiceBusReceivedMessage receivedMessage = await receiver.ReceiveMessageAsync();

        // get the message body as a string
        string body = receivedMessage.Body.ToString();
        Console.WriteLine(body);
    }
}