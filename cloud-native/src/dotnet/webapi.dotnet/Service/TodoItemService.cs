using MongoDB.Bson;
using MongoDB.Driver;
using System.Collections.Generic;
using System.Threading.Tasks;
using webapi.dotnet.Data;
using webapi.dotnet.Models;

namespace webapi.dotnet.Service
{
    public class TodoItemService : ITodoItemService
    {
        private readonly ITodoContext _context;

        public TodoItemService(ITodoContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Creates new Todo Item
        /// </summary>
        /// <param name="todo"></param>
        /// <returns></returns>
        public async Task Create(TodoItem todo)
        {
            try
            {
                await _context.Todos.InsertOneAsync(todo);
            }
            catch (System.Exception)
            {

                throw;
            }
            
        }

        /// <summary>
        /// Delete an Item from the list
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> Delete(long id)
        {
            try
            {
                FilterDefinition<TodoItem> filter = Builders<TodoItem>.Filter.Eq(m => m.Id, id);
                DeleteResult deleteResult = await _context
                                                    .Todos
                                                  .DeleteOneAsync(filter).ConfigureAwait(false);
                return deleteResult.IsAcknowledged
                    && deleteResult.DeletedCount > 0;
            }
            catch (System.Exception)
            {

                throw;
            }
            
        }

        /// <summary>
        /// Get all Todo items
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<TodoItem>> GetAllTodos()
        {
            try
            {
                return await _context
                            .Todos
                            .Find(_ => true)
                            .ToListAsync();
            }
            catch (System.Exception)
            {

                throw;
            }
            
        }

        /// <summary>
        /// Get Next Id From the Document
        /// </summary>
        /// <returns></returns>
        public async Task<long> GetNextId()
        {
            try
            {
                return await _context.Todos.CountDocumentsAsync(new BsonDocument()) + 1;
            }
            catch (System.Exception)
            {

                throw;
            }
            
        }

        /// <summary>
        /// Get a Specific Item
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Task<TodoItem> GetTodo(long id)
        {
            try
            {
                FilterDefinition<TodoItem> filter = Builders<TodoItem>.Filter.Eq(m => m.Id, id);
                return _context
                        .Todos
                        .Find(filter)
                        .FirstOrDefaultAsync();
            }
            catch (System.Exception)
            {

                throw;
            }
           
        }

        /// <summary>
        /// Update a ToDo Item
        /// </summary>
        /// <param name="todo"></param>
        /// <returns></returns>
        public async Task<bool> Update(TodoItem todo)
        {
            try
            {
                ReplaceOneResult updateResult =
                await _context
                        .Todos
                        .ReplaceOneAsync(
                            filter: g => g.Id == todo.Id,
                            replacement: todo);

                return updateResult.IsAcknowledged
                        && updateResult.ModifiedCount > 0;

            }
            catch (System.Exception)
            {

                throw;
            }
        }
    }
}
