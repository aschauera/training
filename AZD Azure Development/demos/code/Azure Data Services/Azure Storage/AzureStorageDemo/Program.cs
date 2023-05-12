
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using System.Text.Json;

internal partial class Program
{
    static async Task Main(string[] args)
    {
        var connStr = "DefaultEndpointsProtocol=https;AccountName=bkstrainingstorage01;AccountKey=OPCn5MHGkridZ+hzn79cTBrdqc5nxscGQpsUE8bQ5xvI4DOhY0FdqxDD8WQ3PLIByn+ajOjTGZ6V+AStdO6EPw==;EndpointSuffix=core.windows.net";
        await ConnectAccountAsync(connStr);
        await ConnectAndCreateBlobAsync(connStr);
       // await DeleteContainerAsync(connStr);
    }

    static async Task ConnectAccountAsync(string connectionString)
    {
        BlobServiceClient service = new BlobServiceClient(connectionString);
        Console.WriteLine("Connecting");
        // Verify connection
        var props = await service.GetAccountInfoAsync();
        Console.WriteLine("--- BlobProperties ---");
        Console.WriteLine("Account kind:" + props.Value.AccountKind);

    }

    static async Task ConnectAndCreateBlobAsync(string connectionString)
    {
        BlobContainerClient container = new BlobContainerClient(connectionString, "sample-container01");
        try
        {
            System.Console.WriteLine("Creating container");

            // Create a blob that can be accessed publicly
            await container.CreateAsync(PublicAccessType.Blob);

            System.Console.WriteLine("Creating BLOB");

            BlobClient blob = container.GetBlobClient("sample-blob01.json");
    

            var c = new Customer("Andreas", "Aschauer");

            System.Console.WriteLine("Uploading content..");
            await blob.UploadAsync(BinaryData.FromObjectAsJson(c));

            // Anonymously access a blob given its URI
            Uri endpoint = blob.Uri;
            BlobClient anonymous = new BlobClient(endpoint);

            // Verify connection
            await anonymous.GetPropertiesAsync();

            //Download
            var download = await blob.DownloadContentAsync();
            Customer? cust = JsonSerializer.Deserialize<Customer>(download.Value.Content);
            System.Console.WriteLine("Downloaded customer data: -----------");
            System.Console.WriteLine(@"{0} - {1} ", cust.Firstname, cust.Lastname);

        }
        finally
        {
            // await container.DeleteAsync();
        }
    }

    static async Task ListBlobs(string connectionString)
    {
        var container = new BlobContainerClient(connectionString, "sample-container01");
        
        await foreach (BlobItem blob in container.GetBlobsAsync())
        {
            System.Console.WriteLine("Blob: " + blob.Name);
        }
    }

    static async Task DeleteContainerAsync(string connectionString)
    {

        BlobContainerClient container = new BlobContainerClient(connectionString, "sample-container01");
        await container.DeleteAsync();

    }
}