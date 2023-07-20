import 'package:hive/hive.dart';
import 'package:sukub/scheduler/db/task.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0; // Unique identifier for the adapter

  @override
  Task read(BinaryReader reader) {
    // Read and return the Task object from binary
    return Task(
      title: reader.readString(),
      note: reader.readString(),
      date: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      startTime: reader.readString(),
      endTime: reader.readString(),
      remind: reader.readInt(),
      repeat: reader.readString(),
      color: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    // Write the Task object to binary
    writer.writeString(obj.title);
    writer.writeString(obj.note);
    writer.writeInt(obj.date.millisecondsSinceEpoch);
    writer.writeString(obj.startTime);
    writer.writeString(obj.endTime);
    writer.writeInt(obj.remind);
    writer.writeString(obj.repeat);
    writer.writeInt(obj.color);
  }
}
