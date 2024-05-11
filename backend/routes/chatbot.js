const axios = require('axios');
const express = require('express');
const router = express.Router();
require('dotenv').config();

router.post('/', async (req, res) => {
    const { prompt, maxTokens = 100, temperature = 0.7 } = req.body;

    try {
        const response = await axios.post('https://api.openai.com/v1/chat/completions', {
            max_tokens: maxTokens,
            temperature: temperature,
            model: "gpt-4-turbo",
            messages: [{ "role": "system", content: "What does " + prompt + " mean in the context of Small and Medium Enterprises (SMEs)? Explain it in simple terms. Give me direct answers no need for adding in context of SMEs in 99 tokens" }]
        }, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`
            }
        });

        res.json({ text: response.data.choices[0].message.content });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ error: 'Failed to generate response' });
    }
});
module.exports = router;