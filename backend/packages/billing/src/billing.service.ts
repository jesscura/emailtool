export class BillingService {
  charge(userId: string, amountCents: number) {
    // TODO: integrate with a payment provider (e.g., Stripe)
    // eslint-disable-next-line no-console
    console.log(`Charging user ${userId} amount ${amountCents} cents`);
    return { success: true } as const;
  }
}
