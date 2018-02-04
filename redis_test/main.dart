import "package:redis_client/redis_client.dart";
import "dart:io";
import "dart:convert";

main()
{
  String connectionString = "localhost:6379";
  RedisClient.connect(connectionString)
    .then((RedisClient client) {
      client.set('Data','{ "Name " : "Abhijeet" , "MidName" : "Anant" , "LastName" : "Sane"}')
      .then((_) => client.get('Data'))
      .then((value) {
        Map data_map = JSON.decode(value);
        data_map.forEach((key,value) {          
            print("Key   : " + key);
            print("Value : " + value);
            print("\n");
        }); 
        exit(0);       
      });
    });    
}