using MongoDB.Driver;
using webapi.dotnet.Configuration;
using webapi.dotnet.Models;

namespace webapi.dotnet.Data
{
    public class TodoContext : ITodoContext
    {
        private readonly IMongoDatabase _db;
        public TodoContext(MongoDbConfig config)
        {
            var client = new MongoClient(config.ConnectionString);
            _db = client.GetDatabase(config.Database);
        }
        public IMongoCollection<TodoItem> Todos => _db.GetCollection<TodoItem>("Todos");
    }
}
