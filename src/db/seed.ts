import { reset, seed } from 'drizzle-seed'
import { db, sql } from './connection.ts'
import { schema } from './schema/index.ts'

await reset(db, schema)

await seed(db, schema).refine((faker) => {
  return {
    rooms: {
      count: 5,
      columns: {
        name: faker.companyName(),
        description: faker.loremIpsum(),
      },
      with: {
        questions: 5,
      },
    },
  }
})

await sql.end()

// biome-ignore lint/suspicious/noConsole: only used in dev
console.log('Database seeded successfully.')
