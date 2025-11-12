export class EmailService {
  send(to: string, template: string, data: Record<string, unknown>) {
    // TODO: integrate with real email provider (SendGrid/SES)
    // eslint-disable-next-line no-console
    console.log(`Email queued to ${to} with template ${template}`);
    return true;
  }
}
