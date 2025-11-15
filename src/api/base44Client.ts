// Base44 Client - Connects to static documents dataset
import { DOCUMENTS_DATA } from './staticData';

class Base44Client {
  auth = {
    logout: () => {
      // Implement logout logic
      console.log('Logging out...');
      window.location.href = '/';
    }
  };

  entities = {
    Document: {
      list: async (sort: string = '-created_date') => {
        try {
          console.log('📡 Loading documents from static data');
          
          // Make a copy to avoid mutating original
          let documents = JSON.parse(JSON.stringify(DOCUMENTS_DATA));
          console.log('✅ Documents loaded:', documents.length);
          
          // Apply sorting
          if (sort === '-created_date') {
            documents.sort((a: any, b: any) => new Date(b.created_date).getTime() - new Date(a.created_date).getTime());
          } else if (sort === 'created_date') {
            documents.sort((a: any, b: any) => new Date(a.created_date).getTime() - new Date(b.created_date).getTime());
          }
          
          return documents;
        } catch (error) {
          console.error('❌ Error loading documents:', error);
          return [];
        }
      },
      
      get: async (id: string) => {
        try {
          console.log('📡 Fetching document:', id);
          const doc = DOCUMENTS_DATA.find((d: any) => d.id === id);
          if (!doc) throw new Error('Document not found');
          return doc;
        } catch (error) {
          console.error('❌ Error fetching document:', error);
          return null;
        }
      },
      
      create: async (data: any) => {
        try {
          console.log('📤 Creating document');
          console.log('📋 Document data:', data);
          
          // Simulate document creation with new ID
          const newDocument = {
            id: Date.now().toString(),
            ...data,
            created_date: new Date().toISOString()
          };
          
          // Add to static data (note: won't persist on page reload)
          (DOCUMENTS_DATA as any).push(newDocument);
          
          console.log('✅ Document created:', newDocument.id);
          return newDocument;
        } catch (error) {
          console.error('❌ Error creating document:', error);
          throw error;
        }
      },
      
      update: async (id: string, data: any) => {
        try {
          console.log('📝 Updating document:', id);
          
          const index = DOCUMENTS_DATA.findIndex((d: any) => d.id === id);
          if (index === -1) throw new Error('Document not found');
          
          (DOCUMENTS_DATA as any)[index] = { ...(DOCUMENTS_DATA as any)[index], ...data };
          return (DOCUMENTS_DATA as any)[index];
        } catch (error) {
          console.error('❌ Error updating document:', error);
          throw error;
        }
      },
      
      delete: async (id: string) => {
        try {
          console.log('🗑️ Deleting document:', id);
          
          const index = DOCUMENTS_DATA.findIndex((d: any) => d.id === id);
          if (index === -1) throw new Error('Document not found');
          
          DOCUMENTS_DATA.splice(index, 1);
          return { message: 'Document deleted' };
        } catch (error) {
          console.error('❌ Error deleting document:', error);
          throw error;
        }
      }
    }
  };
}

export const base44 = new Base44Client();
