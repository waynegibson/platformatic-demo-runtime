/// <reference types="@platformatic/db" />
import { EntityHooks } from '@platformatic/sql-mapper'
import { EntityTypes, Member } from './types'

declare module 'fastify' {
  interface FastifyInstance {
    getSchema<T extends 'Member'>(schemaId: T): {
      '$id': string,
      title: string,
      description: string,
      type: string,
      properties: {
        [x in keyof EntityTypes[T]]: { type: string, nullable?: boolean }
      },
      required: string[]
    };
  }
}

declare module '@platformatic/sql-mapper' {
  interface Entities {
    member: Entity<Member>,
  }
}

declare module '@platformatic/types' {
  interface PlatformaticApp {
    addEntityHooks(entityName: 'member', hooks: EntityHooks<Member>): any
  }
}
