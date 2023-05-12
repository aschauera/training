susing Azure.Messaging;
using Azure.Messaging.ServiceBus;

internal class Program
{
    private static async Task Main(string[] args)
    {
        string connectionString = "Endpoint=sb://aaprepbus.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=w9YPLurGTF1O8lyMhcQql5unsoMonL3XX2sVkaJlQus=";
        string queueName = "aaprepqueue";

        // create a payload using the CloudEvent type
        var cloudEvent = new CloudEvent(
            "/cloudevents/example/source",
            "Example.Employee",
            new Employee { Name = "Homer", Age = 39 });

        ServiceBusMessage message = new ServiceBusMessage(new BinaryData(cloudEvent))
        {
            ContentType = "application/cloudevents+json"
        };

        await using var client = new ServiceBusClient(connectionString);

        // create the sender
        ServiceBusSender sender = client.CreateSender(queueName);
        // send the message
        await sender.SendMessageAsync(message);

        // create a receiver that we can use to receive and settle the message
        ServiceBusReceiver receiver = client.CreateReceiver(queueName);

        // receive the message
        ServiceBusReceivedMessage receivedMessage = await receiver.ReceiveMessageAsync();

        // deserialize the message body into a CloudEvent
        CloudEvent receivedCloudEvent = CloudEvent.Parse(receivedMessage.Body);
        // deserialize
        Employee receivedEmployee = receivedCloudEvent.Data.ToObjectFromJson<Employee>();

        Console.WriteLine(receivedEmployee.Name);
        Console.WriteLine(receivedEmployee.Age);
    }
}

internal class Employee
{
    public string? Name { get; set; }
    public int Age { get; set; }
}