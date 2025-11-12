import 'reflect-metadata';
import { NestFactory } from '@nestjs/core';
import { WorkersModule } from './workers.module';
// Workers do not listen on an HTTP port, they just start processing
// Queues on startup.

async function bootstrap() {
  await NestFactory.createApplicationContext(WorkersModule);
  // eslint-disable-next-line no-console
  console.log('BullMQ Workers initialized. Listening for jobs...');
}
bootstrap();