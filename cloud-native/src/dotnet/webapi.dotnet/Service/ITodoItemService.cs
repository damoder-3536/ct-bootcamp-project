using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using webapi.dotnet.Models;

namespace webapi.dotnet.Service
{
    public interface ITodoItemService
    {
        // api/[GET]
        Task<IEnumerable<TodoItem>> GetAllTodos();
        // api/1/[GET]
        Task<TodoItem> GetTodo(long id);
        // api/[POST]
        Task Create(TodoItem todo);
        // api/[PUT]
        Task<bool> Update(TodoItem todo);
        // api/1/[DELETE]
        Task<bool> Delete(long id);
        Task<long> GetNextId();
    }
}
