using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace webapi.dotnet.Configuration
{
    public class AppSettingsManager
    {
        public MongoDbConfig MongoDB { get; set; } = new MongoDbConfig();
    }
}
