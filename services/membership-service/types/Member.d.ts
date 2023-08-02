/**
 * Member
 * A Member
 */
declare interface Member {
    id?: string;
    createdAt?: string | null;
    firstName: string;
    lastName: string;
    slug?: string | null;
    status: string;
    title: string;
    updatedAt?: string | null;
}
export { Member };
