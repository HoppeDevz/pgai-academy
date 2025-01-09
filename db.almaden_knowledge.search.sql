SELECT
    ake.id,
	ak.problem,
	ak.solution,
    embedding <=> ai.openai_embed(
        'text-embedding-3-small', 
        'chrome crashing sometimes',
        dimensions=>768
    ) as distance
FROM 
    almaden_knowledge_embedding_store ake
    INNER JOIN almaden_knowledge ak ON (ak.id = ake.id) 
ORDER BY 
    distance;