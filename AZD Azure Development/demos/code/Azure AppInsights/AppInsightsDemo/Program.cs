
//dotnet add package Microsoft.ApplicationInsights 
//dotnet add package Microsoft.ApplicationInsights.DependencyCollector

using Microsoft.ApplicationInsights;
using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.ApplicationInsights.DependencyCollector;
using System.Net.Http;
using System.Threading.Tasks;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            TelemetryClient telemetryClient;
            TelemetryConfiguration configuration = TelemetryConfiguration.CreateDefault();

            configuration.ConnectionString = "InstrumentationKey=09e30aea-224b-42f8-9f61-b01e28664937;IngestionEndpoint=https://westeurope-5.in.applicationinsights.azure.com/;LiveEndpoint=https://westeurope.livediagnostics.monitor.azure.com/";

            telemetryClient = new TelemetryClient(configuration);
            try
            {
                telemetryClient.TrackTrace("Only my own events traced");

                configuration.TelemetryInitializers.Add(new HttpDependenciesParsingTelemetryInitializer());

                using (InitializeDependencyTracking(configuration))
                {
                    // run app...

                    telemetryClient.TrackTrace("Hello World!");
                    
                    using (var httpClient = new HttpClient())
                    {
                        // Http dependency is automatically tracked!
                        httpClient.GetAsync("https://microsoft.co1").Wait();
                    }

                }

                throw new NotImplementedException("TEST: Not implemented");

            }
            catch (Exception e)
            {
                telemetryClient.TrackException(e);
                System.Console.WriteLine("Exception tracked");
            }
            finally
            {
                // before exit, flush the remaining data
                telemetryClient.Flush();

                Task.Delay(5000).Wait();
            }
        }

        static DependencyTrackingTelemetryModule InitializeDependencyTracking(TelemetryConfiguration configuration)
        {
            var module = new DependencyTrackingTelemetryModule();

            // prevent Correlation Id to be sent to certain endpoints. You may add other domains as needed.
            module.ExcludeComponentCorrelationHttpHeadersOnDomains.Add("core.windows.net");
            module.ExcludeComponentCorrelationHttpHeadersOnDomains.Add("core.chinacloudapi.cn");
            module.ExcludeComponentCorrelationHttpHeadersOnDomains.Add("core.cloudapi.de");
            module.ExcludeComponentCorrelationHttpHeadersOnDomains.Add("core.usgovcloudapi.net");
            module.ExcludeComponentCorrelationHttpHeadersOnDomains.Add("localhost");
            module.ExcludeComponentCorrelationHttpHeadersOnDomains.Add("127.0.0.1");

            // enable known dependency tracking, note that in future versions, we will extend this list. 
            // please check default settings in https://github.com/microsoft/ApplicationInsights-dotnet-server/blob/develop/WEB/Src/DependencyCollector/DependencyCollector/ApplicationInsights.config.install.xdt

            module.IncludeDiagnosticSourceActivities.Add("Microsoft.Azure.ServiceBus");
            module.IncludeDiagnosticSourceActivities.Add("Microsoft.Azure.EventHubs");

            // initialize the module
            module.Initialize(configuration);

            return module;
        }
    }
}