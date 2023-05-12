using Azure;
using Azure.Data.Tables;
// Record type for table entry
public record Product : ITableEntity
{
    public string RowKey { get; set; } = default!;

    public string PartitionKey { get; set; } = default!;

    public string Name { get; init; } = default!;

    public int Quantity { get; init; }

    public bool Sale { get; init; }

    public ETag ETag { get; set; } = default!;

    public DateTimeOffset? Timestamp { get; set; } = default!;
    ETag ITableEntity.ETag { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
}
