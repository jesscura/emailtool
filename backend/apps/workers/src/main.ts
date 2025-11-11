import { NestFactory } from '@nestjs/core';
import { WorkersModule } from './workers.module';
// Workers do not listen on an HTTP port, they just start processing
// Queues on startup.

async function bootstrap() {
  const app = await NestFactory.createApplicationContext(WorkersModule);
  // Application context starts the services (like BullMQ Queue Processors)
  // Workers will run in the background.
  console.log('BullMQ Workers are running and listening for jobs...');
}
bootstrap();