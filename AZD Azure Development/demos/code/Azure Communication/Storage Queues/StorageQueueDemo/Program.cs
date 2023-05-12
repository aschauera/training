using System; // Namespace for Console output
using System.Configuration; // Namespace for ConfigurationManager
using System.Threading.Tasks; // Namespace for Task
using Azure.Identity;
using Azure.Storage.Queues; // Namespace for Queue storage types
using Azure.Storage.Queues.Models; // Namespace for PeekedMessage

internal class Program
{
    private static async Task Main(string[] args)
    {
        string queueName = "bksorderqueue01";

        // Get the connection string from app settings
        string connectionString = "DefaultEndpointsProtocol=https;AccountName=bkstrainingstorage01;AccountKey=uBfmlCoERa4hiMPmPBxU3C7ODlGkGkir9LL73rrrGcLoq63leyEh4U0y4CY28phJsH+IzcAd42sc+AStGL+TKw==;EndpointSuffix=core.windows.net";

        // Instantiate a QueueClient which will be used to manipulate the queue
        QueueClient queueClient = new QueueClient(connectionString, queueName);

        // Create the queue if it doesn't already exist
        await queueClient.CreateIfNotExistsAsync();

        if (await queueClient.ExistsAsync())
        {
            Console.WriteLine($"Queue '{queueClient.Name}' created");
        }
        else
        {
            Console.WriteLine($"Queue '{queueClient.Name}' exists");
        }

        // Async enqueue the message
        await queueClient.SendMessageAsync("Hello, World");
        Console.WriteLine($"Message added");

        // // Async receive the message
        // QueueMessage[] retrievedMessage = await queueClient.ReceiveMessagesAsync();
        // Console.WriteLine($"Retrieved message with content '{retrievedMessage[0].Body}'");

        // // Async delete the message
        // await queueClient.DeleteMessageAsync(retrievedMessage[0].MessageId, retrievedMessage[0].PopReceipt);
        // Console.WriteLine($"Deleted message: '{retrievedMessage[0].Body}'");

        // // Async delete the queue
        // //await queueClient.DeleteAsync();
        // Console.WriteLine($"Deleted queue: '{queueClient.Name}'");
    }
}
