using Azure;
using Azure.Data.Tables;
// Record type for table entry
public record Customer : ITableEntity
{
    public string RowKey { get; set; } = default!;

    public string PartitionKey { get; set; } = default!;

    public string FirstName { get; init; } = default!;

    public string? LastName { get; init; }

    public IEnumerable<Product> Products { get; set; }

    public ETag ETag { get; set; } = default!;

    public DateTimeOffset? Timestamp { get; set; } = default!;
    ETag ITableEntity.ETag { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
}

public record CustomerForeign : Customer
{
    public string UID { get; set; } = default!;
}