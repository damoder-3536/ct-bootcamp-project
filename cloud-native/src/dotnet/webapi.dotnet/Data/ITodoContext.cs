using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB.Driver;
using webapi.dotnet.Models;

namespace webapi.dotnet.Data
{
    public interface ITodoContext
    {
        IMongoCollection<TodoItem> Todos { get; }
    }
}
