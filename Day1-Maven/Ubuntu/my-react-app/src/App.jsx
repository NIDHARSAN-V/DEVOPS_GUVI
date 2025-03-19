import React from 'react'

export default function App() {
  return (
    <div style={{ 
      display: "flex", 
      flexDirection: "column", 
      alignItems: "center", 
      justifyContent: "center", 
      height: "100vh", 
      backgroundColor: "#121212", 
      color: "white", 
      textAlign: "center"
    }}>
      <h1 style={{ fontSize: "2.5rem", marginBottom: "10px" }}>
        Welcome to React
      </h1>
      <p style={{ fontSize: "1.2rem", marginBottom: "20px" }}>
        Running in Nidharsan Docker Ubuntu Image
      </p>
      <button style={{ 
        padding: "10px 20px", 
        fontSize: "1rem", 
        color: "white", 
        backgroundColor: "#007bff", 
        border: "none", 
        borderRadius: "5px", 
        cursor: "pointer" 
      }}>
        Get Started
      </button>
    </div>
  );
}

