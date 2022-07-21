using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace webapi.dotnet.Models 
{
  public class TodoItem
  {
      [BsonId]
      public ObjectId InternalId { get; set; }
      public long Id { get; set; }
      public string Name { get; set; }
      public bool IsComplete { get; set; }
  }
  
}