using Azure.Data.Tables;

internal class Program
{
    static TableClient? tableClient;
    private static async Task Main(string[] args)
    {
        // AUTHENTICATE
        var connStr = "DefaultEndpointsProtocol=https;AccountName=bkstrainingcosmosdb01;AccountKey=YCaW2nTQaTlP2hKxBXD1cYtUleLMmzivZWsX38jcLb6JNlhfCo4lefRuPorRTBb254V929T59MB0ACDbZ8L0vQ==;TableEndpoint=https://bkstrainingcosmosdb01.table.cosmos.azure.com:443/;";
        TableServiceClient tableServiceClient = new TableServiceClient(connStr);

        // CREATE TABLES
        tableClient = tableServiceClient.GetTableClient(
            tableName: "adventureworks"
        );

        await tableClient.CreateIfNotExistsAsync();

        CreateItems();
        // Query();
        Task.Delay(5000);
    }

    static async void CreateItems()
    {
        // Create new item using composite key constructor
        var prod1 = new Product()
        {
            RowKey = "68719518388",
            PartitionKey = "gear-surf-surfboards",
            Name = "Ocean Surfboard",
            Quantity = 8,
            Sale = true
        };

        // 
        var cust1 = new Customer()
        {
            RowKey = "687195183812",
            PartitionKey = "customer-b2c",
            FirstName = "Andreas",
            LastName = "Aschauer"
        };

        // Create new derived object
        var cust2 = new CustomerForeign()
        {
            RowKey = "687195183812",
            PartitionKey = "customer-b2c",
            FirstName = "Max",
            LastName = "Aschauer",
            UID = "DE01010101"
        };

        var prod12 = new Product()
        {
            RowKey = "68719518384",
            PartitionKey = "gear-surf-surfboards",
            Name = "Ocean Surfboard33",
            Quantity = 8,
            Sale = true
        };

        var prod3 = new Product()
        {
            RowKey = "68719518387",
            PartitionKey = "gear-surf-surfboards",
            Name = "Ocean Surfboard 2",
            Quantity = 8,
            Sale = true
        };

        List<Product> products = new List<Product>();
        products.Add(prod12);
        products.Add(prod3);

        cust2.Products = products;

        // Add new item to server-side table
        //await tableClient.AddEntityAsync(prod1);
        //await tableClient.AddEntityAsync(cust1);
        await tableClient.AddEntityAsync(cust2);
    }

    static async void Query()
    {
        var products = tableClient.Query<Product>(x => x.PartitionKey == "gear-surf-surfboards");

        Console.WriteLine("Multiple products:");
        foreach (var item in products)
        {
            Console.WriteLine(item.Name);
        }
    }

    static async void CreateWithTableEntity()
    {
        // Create new item using composite key constructor
        TableEntity item1 = new(
            rowKey: "68719518388",
            partitionKey: "gear-surf-surfboards"
        );

        // Add properties to item
        item1.Add("Name", "Sunnox Surfboard");
        item1.Add("Quantity", 8);
        item1.Add("Sale", true);

        // Add new item to server-side table
        await tableClient.AddEntityAsync<TableEntity>(item1);
    }

    static async void ReadWithTableEntity()
    {
        TableEntity readItem = await tableClient.GetEntityAsync<TableEntity>(
            partitionKey: "68719518388",
            rowKey: "gear-surf-surfboards"
        );

        System.Console.WriteLine(readItem["name"]);
    }

    static async void CreateWithDictionary()
    {
        // Create dictionary
    Dictionary<string, object> properties = new()
    {
        { "RowKey", "68719518388" },
            { "PartitionKey", "gear-surf-surfboards" },
            { "Name", "Sunnox Surfboard" },
            { "Quantity", 8 },
            { "Sale", true }
        };

        // Create new item using dictionary constructor
        TableEntity item2 = new(
            values: properties
        );

        // Add new item to server-side table
        await tableClient.AddEntityAsync<TableEntity>(item2);
            }
}
