import {
	Box,
	Flex,
	Text,
	useBreakpointValue,
	Heading,
	Stack,
	UnorderedList,
	ListItem,
} from "@chakra-ui/react";

const ordensServico = [
	{
		id: 1,
		status: "onHold",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
	{
		id: 2,
		status: "onHold",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
	{
		id: 3,
		status: "inProgress",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
	{
		id: 4,
		status: "inProgress",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
	{
		id: 5,
		status: "inProgress",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
	{
		id: 6,
		status: "inProgress",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
	{
		id: 7,
		status: "inProgress",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
	{
		id: 8,
		status: "inProgress",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
	{
		id: 9,
		status: "done",
		materialUtilizado: {
			quantidade: "50 Kg",
			tipo: "Asfalto",
		},
	},
];

const cidadoes = [
	{ name: "Valentín Jouni", value: 3000 },
	{ name: "Arseny Katashi", value: 2800 },
	{ name: "Pénélope Yunus", value: 2600 },
	{ name: "Valeriy Imran", value: 2300 },
	{ name: "Joss Nekoda", value: 2000 },
	{ name: "Neven Kiko", value: 1800 },
	{ name: "Châu Maiken", value: 1600 },
	{ name: "Kyran Puck", value: 1500 },
	{ name: "Renatus Jeffry", value: 1300 },
];

function App() {
	return (
		<Flex bg="gray.200" minH="100vh" direction="column" pb="5rem">
			<Box w="100%">
				<Flex
					bg="gray.600"
					color="white"
					minH="60px"
					py={{ base: 2 }}
					px={{ base: 4 }}
					boxShadow="md"
					align="center"
				>
					<Flex flex={{ base: 1 }} justify={{ base: "center", md: "center" }}>
						<Text
							textAlign={useBreakpointValue({ base: "center", md: "center" })}
							fontSize="2rem"
							color="white"
							fontWeight="bold"
						>
							SRCB
						</Text>
					</Flex>
				</Flex>
			</Box>

			<Stack pt="3rem" px="10rem" direction="column" spacing="1rem">
				<Heading
					as="h4"
					size="md"
					pb="2"
					px="5"
					borderBottom="1px solid #4A5568"
				>
					Ordens de Serviços
				</Heading>
				<Flex>
					<UnorderedList>
						<ListItem>
							Aguardando Atendimento{" - "}
							<strong>
								{
									ordensServico.filter((ordem) => ordem.status === "onHold")
										.length
								}
							</strong>
						</ListItem>
						<ListItem>
							Em Andamento{" - "}
							<strong>
								{
									ordensServico.filter((ordem) => ordem.status === "inProgress")
										.length
								}
							</strong>
						</ListItem>
						<ListItem>
							Concluído{" - "}
							<strong>
								{
									ordensServico.filter((ordem) => ordem.status === "done")
										.length
								}
							</strong>
						</ListItem>
					</UnorderedList>
				</Flex>
			</Stack>

			<Stack pt="3rem" px="10rem" direction="column" spacing="1rem">
				<Heading
					as="h4"
					size="md"
					pb="2"
					px="5"
					borderBottom="1px solid #4A5568"
				>
					Pagamento Total de Danos por Cidadão
				</Heading>
				<Flex>
					<UnorderedList>
						{cidadoes.map((cidadao) => (
							<ListItem key={cidadao.name}>
								{cidadao.name} - <strong>R$ {cidadao.value},00</strong>
							</ListItem>
						))}
					</UnorderedList>
				</Flex>
			</Stack>

			<Stack pt="3rem" px="10rem" direction="column" spacing="1rem">
				<Heading
					as="h4"
					size="md"
					pb="2"
					px="5"
					borderBottom="1px solid #4A5568"
				>
					Equipes
				</Heading>
				<Flex>
					<UnorderedList>
						<ListItem>
							Quantidade de Equipes - <strong>3</strong>
						</ListItem>
					</UnorderedList>
				</Flex>
			</Stack>

			<Stack pt="3rem" px="10rem" direction="column" spacing="1rem">
				<Heading
					as="h4"
					size="md"
					pb="2"
					px="5"
					borderBottom="1px solid #4A5568"
				>
					Materiais Utilizados por Ordem de Serviço
				</Heading>
				<Flex>
					<UnorderedList>
						{ordensServico.map((ordem) => (
							<ListItem key={ordem.id} mb="5">
								Ordem {ordem.id}: <br />
								Quantidade -{" "}
								<strong>{ordem.materialUtilizado.quantidade}</strong> <br />
								Tipo - <strong>{ordem.materialUtilizado.tipo}</strong>
							</ListItem>
						))}
					</UnorderedList>
				</Flex>
			</Stack>

			<Stack pt="3rem" px="10rem" direction="column" spacing="1rem">
				<Heading
					as="h4"
					size="md"
					pb="2"
					px="5"
					borderBottom="1px solid #4A5568"
				>
					Equipamentos Utilizados por Ordem de Serviço
				</Heading>
				<Flex>
					<UnorderedList>
						{ordensServico.map((ordem) => (
							<ListItem key={ordem.id} mb="5">
								Ordem {ordem.id}: <br />
								<strong>Vibroacabadora de Asfalto</strong>
							</ListItem>
						))}
					</UnorderedList>
				</Flex>
			</Stack>
		</Flex>
	);
}

export default App;
