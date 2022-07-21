using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using webapi.dotnet.Data;
using webapi.dotnet.Models;
using webapi.dotnet.Service;

namespace webapi.dotnet.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class TodoItemsController : ControllerBase
    {
        private readonly ITodoItemService _todoService;

        public TodoItemsController(ITodoItemService todoService)
        {
            _todoService = todoService;
        }

        // GET: api/TodoItems
        /// <summary>
        /// List all items Items
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TodoItem>>> GetTodoItems()
        {
            return new ObjectResult(await _todoService.GetAllTodos());
        }

        // GET: api/TodoItems/5
        /// <summary>
        /// Get an Item
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<ActionResult<TodoItem>> GetTodoItem(long id)
        {
            var todoItem = await _todoService.GetTodo(id);

            if (todoItem == null)
            {
                return NotFound();
            }

            return new ObjectResult(todoItem);
        }

        // PUT: api/TodoItems/5
        /// <summary>
        /// Update an Item
        /// </summary>
        /// <param name="id"></param>
        /// <param name="todoItem"></param>
        /// <returns></returns>
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTodoItem(long id, TodoItem todoItem)
        {
            if (todoItem == null || (todoItem != null && id != todoItem.Id))
            {
                return BadRequest();
            }

            var todoFromDb = await _todoService.GetTodo(id);

            if (todoFromDb == null)
                return new NotFoundResult();

            todoItem.Id = todoFromDb.Id;
            todoItem.InternalId = todoFromDb.InternalId;
            await _todoService.Update(todoItem);
            return new OkObjectResult(todoItem);
        }

        // POST: api/TodoItems
        /// <summary>
        /// Create new Item 
        /// </summary>
        /// <param name="todoItem"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<ActionResult<TodoItem>> PostTodoItem(TodoItem todoItem)
        {
            if (todoItem == null)
            {
                return BadRequest();
            }

            todoItem.Id = await _todoService.GetNextId();
            await _todoService.Create(todoItem);
            return new OkObjectResult(todoItem);
        }

        // DELETE: api/TodoItems/5
        /// <summary>
        /// Delete Item
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<ActionResult<TodoItem>> DeleteTodoItem(long id)
        {
            var post = await _todoService.GetTodo(id);
            if (post == null)
                return new NotFoundResult();
            await _todoService.Delete(id);
            return new OkResult();
        }

    }
}
