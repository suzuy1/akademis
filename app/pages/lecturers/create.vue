<template>
  <div>
    <h1>Add New Lecturer</h1>
    <form @submit.prevent="addLecturer">
      <input v-model="lecturer.nip" placeholder="NIP" />
      <input v-model="lecturer.name" placeholder="Name" />
      <input v-model="lecturer.departemen" placeholder="Departemen" />
      <button type="submit">Add Lecturer</button>
    </form>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';

const supabase = useSupabaseClient()
const router = useRouter()
const lecturer = ref({
  nip: '',
  name: '',
  departemen: ''
})

const addLecturer = async () => {
  const { data, error } = await supabase.from('lecturers').insert([lecturer.value])
  if (error) {
    console.error(error)
  } else {
    router.push('/lecturers')
  }
}
</script>
