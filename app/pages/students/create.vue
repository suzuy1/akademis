<template>
  <div>
    <h1>Add New Student</h1>
    <form @submit.prevent="addStudent">
      <input v-model="student.nim" placeholder="NIM" />
      <input v-model="student.name" placeholder="Name" />
      <input v-model="student.jurusan" placeholder="Jurusan" />
      <input v-model="student.tahun" type="number" placeholder="Tahun" />
      <textarea v-model="student.alamat" placeholder="Alamat"></textarea>
      <button type="submit">Add Student</button>
    </form>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';

const supabase = useSupabaseClient()
const router = useRouter()
const student = ref({
  nim: '',
  name: '',
  jurusan: '',
  tahun: null,
  alamat: ''
})

const addStudent = async () => {
  const { data, error } = await supabase.from('students').insert([student.value])
  if (error) {
    console.error(error)
  } else {
    router.push('/students')
  }
}
</script>
