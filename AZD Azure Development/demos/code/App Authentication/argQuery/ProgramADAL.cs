using Azure.Identity;
using Azure.ResourceManager;
using Azure.ResourceManager.ResourceGraph;
using Azure.ResourceManager.ResourceGraph.Models;

//dotnet add package Microsoft.Azure.Services.AppAuthentication --version 1.5.0

namespace argQuery
{
    class ProgramADAL
    {
        static async Task Main(string[] args)
        // {
        //     string strTenant = args[0];
        //     string strClientId = args[1];
        //     string strClientSecret = args[2];
        //     string strQuery = args[3];
        {
            var strTenant = "307fb92d-5a63-4bbe-919f-632d7bfeca89";
            var strClientId = "f4609bfd-bc4a-4b31-8129-37e27b3eee67";
            var strClientSecret = "Yyc8Q~dXUxDoMGxzBXkvO-MMveOgttOqJowWSbRE";
            var strQuery = "resources";

            var client = new ArmClient(
                new ClientSecretCredential(strTenant, strClientId, strClientSecret));
            var tenant = client.GetTenants().First();
            //Console.WriteLine($"{tenant.Id} {tenant.HasData}");
            var queryContent = new ResourceQueryContent(strQuery);
            var response = tenant.GetResources(queryContent);
            var result = response.Value;
            Console.WriteLine($"Count: {result.Data.ToString()}");
        }
    }
}